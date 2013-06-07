class FriendsController < ApplicationController
  before_filter :fetch_auth_from_facebook
  before_filter :get_graph


  def index
    @app  =  @graph.get_object(ENV["FACEBOOK_APP_ID"])

    if access_token
      @user    = @graph.get_object("me")
      @friends = @graph.get_connections('me', 'friends')
      @photos  = @graph.get_connections('me', 'photos')
      @likes   = @graph.get_connections('me', 'likes').first(4)

      # for other data you can always run fql
      @friends_using_app = @graph.fql_query("SELECT uid, name, is_app_user, pic_square FROM user WHERE uid in (SELECT uid2 FROM friend WHERE uid1 = me()) AND is_app_user = 1")
    end
  end

  private
  def get_graph
    @graph  = Koala::Facebook::API.new(access_token)
  end

end
