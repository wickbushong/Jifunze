class LessonsController < ApplicationController

    def new

    end

    def create

    end

    def show

    end

    def index
        @lessons = Lesson.all
    end

end