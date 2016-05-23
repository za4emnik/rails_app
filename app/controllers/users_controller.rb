class UsersController < BaseController

  def show
    @user = User.find(session[:user_id])
    @image = UserImage.where(user_id: session[:user_id]).page params[:page]

  end

  def index
    @users = User.all.page params[:page]
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    @user.destroy

    redirect_to new_session_path
  end

  private
   def user_params
     params.require(:user).permit(:name, :mail, :password, :user_image)
   end
end
