class SessionsController < ApplicationController
    def create
        if (params[:user][:password]).empty? || (params[:user][:password]).nil?
          redirect_to  '/sessions/new'
        else
          @user = User.find_by(name: params[:user][:name])
          return redirect_to '/sessions/new' if !@user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to '/users/home'
        end
    end 
end 