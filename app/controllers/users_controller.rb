class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]

    def show
        @user = User.find_by(id: params[:id])
        if !@user
            redirect_to lessons_path
        end
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :email, :instructor)
    end
    
end