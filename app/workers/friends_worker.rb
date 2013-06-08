class FriendsWorker

  @queue = :friends_queue

  def self.perform(user_id, access_token)
    user = User.find(user_id, :include => :friends)
    graph  = Koala::Facebook::API.new(access_token)

    fb_friends = graph.get_connections('me', 'friends')
    fb_friends.each do |friend|
      friend = Friend.find_or_create_by_uid(name: friend["name"], uid: friend["id"].to_i)
      user.friends << friend if !friend.in?(user.friends)
    end
  end
end
