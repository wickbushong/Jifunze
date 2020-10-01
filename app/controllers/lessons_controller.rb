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
            redirect_to lesson_path(@lesson)
        else
            render :new
        end
    end

    def show
        @lesson = find_from_params
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

    def edit
        @lesson = find_from_params
        user_root_redirect unless @lesson.instructor_id == current_user.id
    end

    def update
        @lesson = find_from_params
        if @lesson.update(lesson_params)
            redirect_to lesson_path(@lesson)
        else
            render :edit
        end
    end

    def destroy
        lesson = find_from_params
        lesson.destroy
        user_root_redirect
    end

    def book
        binding.pry
    end

    private

    def lesson_params
        params.require(:lesson).permit(:subject, :location, :time, :duration, :notes, :student_id)
    end

    def find_from_params
        Lesson.find_by(id: params[:id])
    end

end