module ApplicationHelper
    
    def time_slot_display(lesson)
        finish = (lesson.time + 60*lesson.duration).strftime("%l:%M %p")
        lesson.time.strftime("%A, %b %d %Y from %l:%M %p to #{finish}")
    end
    
end
