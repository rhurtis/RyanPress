class SessionsController < ApplicationController


    def new
        
    end

    def create
        user = User.find_by_email(params[:email])
        if user.authenticate(params[:password])
            session[:user_id] = user.id
        else
            
        end
    end

    

end