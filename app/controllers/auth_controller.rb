class AuthController < ApplicationController

  FACEBOOK_SCOPE = 'user_likes,user_photos'

  def facebook
    session[:access_token] = nil
    redirect_to authenticator.url_for_oauth_code(:permissions => FACEBOOK_SCOPE)
  end

  def facebook_callback
    session[:access_token] = authenticator.get_access_token(params[:code])
    redirect_to '/'
  end
end
