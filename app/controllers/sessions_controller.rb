class SessionsController < ApplicationController

    def new 
        @user = User.new
        render :new
    end

    def create
        email = params[:user][:email]
        password = params[:user][:password]
        @user = User.find_by_credentials(email, password)
        if @user
            login!(@user)
            render :new
        else
            flash.now[:errors] = ["Invalid email/password"]
            render :new
        end
    end
    
    def destroy
        logout!
        redirect_to new_session_url
    end

end