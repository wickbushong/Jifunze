class LessonsController < ApplicationController
    before_action :set_lesson only: [:show, :edit, :update, :destroy, :book]

    def new
        if !current_user.instructor
            redirect_to lessons_path
        end
        @lesson = Lesson.new
    end

    def create
        @lesson = Lesson.new(lesson_params)
        @lesson.instructor = current_user
        @lesson.booked = true if @lesson.student
        if @lesson.save
            redirect_to lesson_path(@lesson)
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

    def edit
        redirect_to user_path(current_user) unless @lesson.instructor_id == current_user.id
    end

    def update
        if @lesson.update(lesson_params)
            redirect_to lesson_path(@lesson)
        else
            render :edit
        end
    end

    def destroy
        @lesson.destroy
        redirect_to user_path(current_user)
    end

    def book
        if !current_user.instructor
            @lesson.student = current_user
            @lesson.booked = true
            @lesson.save
        end
        redirect_to lesson_path(@lesson)
    end

    private

    def lesson_params
        params.require(:lesson).permit(:subject, :location, :time, :duration, :notes, :student_id)
    end

    def set_lesson
        @lesson = Lesson.find_by(id: params[:id])
        if !@lesson
            redirect_to lessons_path
        end
    end

end