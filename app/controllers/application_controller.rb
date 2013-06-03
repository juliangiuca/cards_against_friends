class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  #def authenticator
    #@authenticator ||= Koala::Facebook::OAuth.new(ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_SECRET"], auth_facebook_callback_url)
  #end

  ## allow for javascript authentication
  #def access_token_from_cookie
    #debugger
    #authenticator.get_user_info_from_cookies(request.cookies)['access_token']
  #rescue => err
    #warn err.message
  #end

  def access_token
    session[:access_token]# || access_token_from_cookie
  end

  def fetch_auth_from_facebook
    session[:access_token] || (redirect_to "/auth/facebook" and return)
  end
end
