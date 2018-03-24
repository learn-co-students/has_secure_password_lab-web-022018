class UsersController < ApplicationController
  def new

  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        redirect_to new_user_path
      end
    else
      redirect_to new_user_path
    end
  end

  def index

  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
  end
end
