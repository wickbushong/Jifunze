module UsersHelper
    def name_link_or_nil(student)
        if student
            link_to student.name, user_path(student)
        else
            "none (yet)"
        end
    end
end