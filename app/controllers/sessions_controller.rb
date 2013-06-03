class SessionsController < ApplicationController

  def create
    debugger
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:access_token] = auth_hash["credentials"]["token"]
    #self.current_user = @user
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
