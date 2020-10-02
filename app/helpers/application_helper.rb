module ApplicationHelper
    
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
        elsif lesson.booked
            "booked"
        else
            "available"
        end
    end

    def name_link_or_nil(student)
        if student
            link_to student.name, user_path(student)
        else
            "none (yet)"
        end
    end
    
end
