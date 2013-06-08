class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :name

  has_many :friendships
  has_many :friends, :through => :friendships

  def self.find_or_create_from_auth_hash(auth, signed_in_resource=nil)
    user = User.find_or_initialize_by_uid(auth["uid"])

    user.uid        = auth.uid.to_i
    user.first_name = auth.info.first_name
    user.last_name  = auth.info.last_name
    user.email      = auth.info.email
    user.nickname   = auth.info.nickname
    user.urls       = auth.info.urls
    user.image      = auth.info.image
    user.location   = auth.info.location
    user.verified   = auth.info.verified

    user.gender     = auth.extra.raw_info.gender
    user.access_token = auth.credentials.token
    user.password   = Devise.friendly_token[0,20]

    user.save if user.changed?
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20]
                           )
    end
    user
  end

  def fetch_friends(graph)
    Resque.enqueue(FriendsWorker, self.id, self.access_token)
  end
end
