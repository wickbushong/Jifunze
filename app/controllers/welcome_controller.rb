class WelcomeController < ApplicationController
    def home
        if current_user
            root_redirect
        end
    end

    private

    def root_redirect
        if current_user.instructor
            redirect_to user_lessons_path(current_user)
        else
            redirect_to user_path(current_user)
        end
            
    end
end