class BaseController < ApplicationController
  before_action :auth,  only: [:new, :create, :destroy, :edit, :index, :show]
  before_action :autorize,  only: [:destroy, :edit, :show]

  private
  def auth
     if session[:user_id]
       @user = User.find(session[:user_id])
       return @user
     else
       redirect_to new_session_path, status:401
     end
  end

  def autorize
    if params[:id] && params[:id].to_i != session[:user_id]
      redirect_to controller: 'users', action: 'show', id: session[:user_id], :alert => "Access denied."
    end
  end
end
