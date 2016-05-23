class ImagesController < ApplicationController

  def new
  end

  def create
    @user = User.find(session[:user_id])
    params[:user_image]['image'].each do |image|
      @image = @user.user_image.create!(:image => image, :user_id => session[:user_id])
    end
    redirect_to @user
  end

  def destroy
    @image = UserImage.find(params[:id])
    @image.destroy

    redirect_to controller: 'users', action: 'show', id: session[:user_id], :alert => "Deleted!."
  end
end
