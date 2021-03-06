module LessonsHelper
    def time_slot_display(lesson)
        finish = (lesson.time + 60*lesson.duration).strftime("%l:%M %p")
        lesson.time.strftime("%A, %b %d %Y from %l:%M %p to #{finish}")
    end

    def lesson_show_page_button(lesson)
        if belongs_to_current_user(lesson)
            link_to "edit lesson", edit_lesson_path(lesson), class: "btn btn-success btn-lg"
        elsif current_user.student? && !lesson.booked
            link_to "book lesson", book_path(lesson), method: "post", class: "btn btn-success btn-lg"
        end
    end

    def status(lesson)
        if lesson.time.past?
            "completed"
        elsif lesson.student
            "booked"
        else
            "available"
        end
    end
end