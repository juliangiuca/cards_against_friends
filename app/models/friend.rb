class Friend < ActiveRecord::Base
   attr_accessible :name, :uid

   has_many :friendships
   has_many :users, :through => :friends

   validates_uniqueness_of :uid
end
