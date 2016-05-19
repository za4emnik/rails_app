class AuthorizationController < ApplicationController


  def check
    if @user = User.find_by(name: params[:name])
    redirect_to authorization_login_path
  end
end
