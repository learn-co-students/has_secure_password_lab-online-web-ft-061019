class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user
      authenticated = @user.authenticate(params[:user][:password])
      if authenticated
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
      else
        flash[:notify] = "#{@user.errors.full_messages.join(", ")}"
        redirect_to sessions_new_path
      end
    else
      flash[:notify] = "Invalid username"
      redirect_to sessions_new_path
    end
  end

  def destroy
    session.delete :user_id
  end

private

  def password_params
    params.require(:user).permit(:password)
  end
  
end
