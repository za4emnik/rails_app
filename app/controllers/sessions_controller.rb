class SessionsController < BaseController

  def new
  end

  def create
  user = User.find_by_mail(params[:session][:mail])
  if user && user.authenticate(params[:session][:password])
    session[:user_id] = user.id
    #session[:auth] = true
    flash.alert = "Welcome back, #{user.name}"
    redirect_to controller: 'users', action: 'show', id: session[:user_id]
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end
  def destroy
    session[:user_id] = nil
    session[:auth] = nil
    flash.alert = "Quit!"
    redirect_to new_session_path
  end
end
