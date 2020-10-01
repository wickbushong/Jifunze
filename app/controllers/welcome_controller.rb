class WelcomeController < ApplicationController
    skip_before_action :require_login

    def home
        if user_is_authenticated
            user_root_redirect
        end
    end

end