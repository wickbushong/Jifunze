class SessionController < ApplicationController
    skip_before_action :require_login, only: [:new, :create, :create_from_facebook]

    def new
        if current_user
            redirect_to user_root_redirect
        end
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:user][:name]) || User.new
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            user_root_redirect
        else
            @user.errors.messages[:invalid] = ["username or password"]
            render :new
        end
    end

    def create_from_facebook
        @user = find_or_create_from_facebook
        session[:user_id] = @user.id
        redirect_to user_root_redirect
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end

    def find_or_create_from_facebook
        User.find_or_create_by(email: auth[:info][:email]) do |u|
            u.name = auth[:info][:name]
            u.email = auth[:info][:email]
            u.password = ('a'..'z').to_a.shuffle[0,8].join
        end
    end

end