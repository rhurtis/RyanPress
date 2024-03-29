class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to "/"
        else
            flash[:alert] = "Incorrect Credentials: Please Try Again"
            redirect_to "/sessions/new"
        end
    end
end