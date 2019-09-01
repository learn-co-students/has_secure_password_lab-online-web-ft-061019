class WelcomeController < ApplicationController

    def homepage
        @user = current_user
    end
end