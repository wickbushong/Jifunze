class User < ApplicationRecord
    # has_many :lesson_students, foreign_key: :lesson_student_id
    # has_many :taken_lessons, through: :lesson_students
    # has_many :given_lessons, foreign_key: :instructor_id, class_name: "Lesson"

    # instructor associations
    has_many :given_lessons, foreign_key: "instructor_id", class_name: "Lesson"
    has_many :students, through: :given_lessons

    # student associations
    has_many :taken_lessons, foreign_key: "student_id", class_name: "Lesson"
    has_many :instructors, through: :taken_lessons

end