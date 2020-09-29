class SessionController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:user][:name]) || User.new
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user) 
        else
            render :new
        end
    end

    def create_from_facebook
        @user = find_or_create_from_facebook
        session[:user_id] = @user.id
        redirect_to user_path(@user)
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