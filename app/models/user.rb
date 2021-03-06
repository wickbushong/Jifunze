class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    scope :instructors, -> { where("instructor == true") }
    scope :students, -> { where("instructor == false") }

    # has_many :lesson_students, foreign_key: :lesson_student_id
    # has_many :taken_lessons, through: :lesson_students
    # has_many :given_lessons, foreign_key: :instructor_id, class_name: "Lesson"

    # instructor associations
    has_many :given_lessons, foreign_key: "instructor_id", class_name: "Lesson"
    has_many :students, through: :given_lessons

    # student associations
    has_many :taken_lessons, foreign_key: "student_id", class_name: "Lesson"
    has_many :instructors, through: :taken_lessons

    def student?
        !self.instructor
    end

end