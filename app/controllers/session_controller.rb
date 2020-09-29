class SessionController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        binding.pry
        if @user = User.find_by(name: params[:user][:name])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def destroy

    end

end