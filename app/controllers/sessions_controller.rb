class SessionsController < ApplicationController
  
  def logout
    session.delete :user_id
    redirect_to index_session_path
  end
  
  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to new_session_path unless user 
    session[:user_id] = user.id
    @user = user
    redirect_to homepage_path
  end

  def new
  end
end
