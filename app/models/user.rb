class User < ActiveRecord::Base
  # attr_accessible :title, :body
  def self.find_or_create_from_auth_hash(auth_hash)
    user = User.find_or_initialize_by_uid(auth_hash["uid"])

    user.uid        = auth_hash["uid"]
    user.first_name = auth_hash["info"]["first_name"]
    user.last_name  = auth_hash["info"]["last_name"]
    user.email      = auth_hash["info"]["email"]
    user.nickname   = auth_hash["info"]["nickname"]
    user.urls       = auth_hash["info"]["urls"]
    user.image      = auth_hash["info"]["image"]
    user.location   = auth_hash["info"]["location"]
    user.verified   = auth_hash["info"]["verified"]

    user.gender     = auth_hash["extra"]["raw_info"]["gender"]
    user.access_token = auth_hash["credentials"]["token"]

    user.save if user.changed?
  end
end
