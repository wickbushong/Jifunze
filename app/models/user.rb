class User < ApplicationRecord
    has_many :lesson_students, foreign_key: :lesson_student_id
    has_many :taken_lessons, through: :lesson_students
    has_many :given_lessons, foreign_key: :instructor_id, class_name: "Lesson"
end