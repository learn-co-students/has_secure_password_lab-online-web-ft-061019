class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  
    if @user.id
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notify] = "#{@user.errors.full_messages.join(", ")}"
      redirect_to new_user_path
    end
  end

  def show
    set_user
  end

private 

  def set_user
    @user = User.find_by_id(session[:user_id])
  end
  

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
  
end
