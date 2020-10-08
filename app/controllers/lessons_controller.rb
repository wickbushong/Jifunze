class LessonsController < ApplicationController
    before_action :set_lesson, only: [:show, :edit, :update, :destroy, :book]
    # before_action :protect_new_lesson, only: [:new, :create]
    before_action :protect_lesson, only: [:edit, :update]


    def new
        @lesson = Lesson.new
    end

    def create
        @lesson = Lesson.new(lesson_params)
        @lesson.instructor = current_user
        if @lesson.save
            change_status
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

    end

    def update
        if @lesson.update(lesson_params)
            change_status
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
            change_status
            @lesson.save
        end
        redirect_to lesson_path(@lesson)
    end

    def physics
        @lessons = Lesson.available.select do |l| 
            l.subject.include?("hysics")
        end
        render "lessons/physics"

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

    def change_status
        if @lesson.student
            @lesson.booked = true
            @lesson.save
        end
    end

    def protect_lesson
        if @lesson.instructor_id != current_user.id
            redirect_to lesson_path(@lesson)
        end
    end

    def protect_new_lesson
        if params[:user_id] && current_user.id != params[:user_id] || !current_user.instructor
            redirect_to lessons_path
        end
    end

end