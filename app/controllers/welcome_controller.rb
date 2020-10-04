class WelcomeController < ApplicationController
    skip_before_action :require_login

    def home
        if user_is_authenticated
            redirect_to user_path(current_user)
        end
    end

end