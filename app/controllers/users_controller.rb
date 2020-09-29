class UsersController < ApplicationController
    
    def show
        @user = User.find_by(id: params[:id])
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
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