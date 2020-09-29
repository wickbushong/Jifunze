class Lesson < ApplicationRecord
    # has_many :lesson_students, foreign_key: :taken_lesson_id
    # has_many :students, through: :lesson_students
    # belongs_to :instructor, class_name: "User"
    scope :available, -> { where("booked == false") }

    belongs_to :instructor, class_name: "User"
    belongs_to :student, class_name: "User"

end