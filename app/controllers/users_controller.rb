class UsersController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully signed up to WAVS!"
      redirect_to root_path
    else
      render :new
    end
  end


  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email,
                                   :username, :password,
                                   :password_confirmation)
    end
end
