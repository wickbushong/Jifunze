class LessonsController < ApplicationController

    def new
        if !current_user.instructor
            redirect_to lessons_path
        end
        @lesson = Lesson.new
    end

    def create
        @lesson = Lesson.new(lesson_params)
        @lesson.instructor = current_user
        if @lesson.save
            redirect_to user_lesson_path(current_user, @lesson)
        else
            render :new
        end
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

    private

    def lesson_params
        params.require(:lesson).permit(:subject, :location, :time, :duration, :notes)
    end

end