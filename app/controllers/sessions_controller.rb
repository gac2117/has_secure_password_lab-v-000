class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "You have sucessfully logged in!"
      redirect_to '/home'
    else
      flash[:warning] = "Please try again."
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id].destroy
    flash[:success] = "You have sucessfully logged out!"
    redirect_to '/login'
  end

end
