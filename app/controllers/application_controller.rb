class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user
    #C urrent user
    #E nsure_logged_in
    #L login!
    #L logged_in?
    #L ogout

    def current_user
        @current_user ||= User.find_by(session_token: session[:session])
    end

    def ensure_logged_in
        redirect_to new_session_url unless logged_in?
    end

    def login!(user)
        session[:session] = user.reset_session_token!
    end

    def logged_in?
        !!current_user
    end

    def logout!
        current_user.reset_session_token!
        @current_user = nil 
        session[:session] = nil
    end

end
