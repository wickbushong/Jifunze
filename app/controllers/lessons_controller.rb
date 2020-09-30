class LessonsController < ApplicationController

    def new
        if !current_user.instructor
            redirect_to lessons_path
        end
        @lesson = Lesson.new
    end

    def create
        binding.pry
    end

    def show

    end

    def index
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
            if !@user.instructor
                redirect_to user_path(current_user)
            end
            @lessons = @user.given_lessons.available
        else
            @lessons = Lesson.available
        end
    end

end