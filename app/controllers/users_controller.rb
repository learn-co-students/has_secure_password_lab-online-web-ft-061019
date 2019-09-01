class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:name])
        if @user
            redirect_to new_session_path
        elsif !@user && User.new(user_params).valid?
            new_user = User.create(user_params)
            session[:user_id] = new_user.id 
            redirect_to homepage_path
        else
            redirect_to new_user_path
        end
    end

    def show

    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end