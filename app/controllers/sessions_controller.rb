class SessionsController < ApplicationController

  def new
  end

  def create
    # binding.pry
    if params[:user][:name].blank?
      redirect_to login_path
    elsif @user = User.find_by(name: params[:user][:name]).authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id].clear
    redirect_to login_path
  end



end
