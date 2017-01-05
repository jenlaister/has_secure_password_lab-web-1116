class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:name, :password, :password_confirmation))
    if @user.save
      current_user 
      redirect_to '/'
    else
      redirect_to signup_path
    end
  end

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end

end
