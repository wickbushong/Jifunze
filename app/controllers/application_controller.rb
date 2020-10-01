class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    # before_action :verified_user
    helper_method :current_user
    helper_method :user_is_authenticated
    helper_method :belongs_to_current_user
    before_action :require_login

    private

    def current_user
        User.find_by(id: session[:user_id])
    end
    
    def user_is_authenticated
        !!current_user
    end

    def require_login
        redirect_to root_path unless user_is_authenticated
    end

    def user_root_redirect
        if current_user.instructor
            redirect_to user_lessons_path(current_user)
        else
            redirect_to user_path(current_user)
        end
    end

    def belongs_to_current_user(lesson)
        lesson.instructor_id == current_user.id
    end

end
