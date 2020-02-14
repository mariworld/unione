class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :current_user
    helper_method :logged_in?
    before_action :errors_notifs
    
    def current_user    
        @user = User.find_by(id: session[:user_id])  
    end

    def errors_notifs
        @errors = flash[:errors]
        @notification = flash[:notification]
    end

    def logged_in?
        !current_user.nil?  
    end

    def authorized
        redirect_to '/welcome' unless logged_in?
    end

end
