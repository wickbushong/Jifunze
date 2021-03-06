class Lesson < ApplicationRecord
    # has_many :lesson_students, foreign_key: :taken_lesson_id
    # has_many :students, through: :lesson_students
    # belongs_to :instructor, class_name: "User"
    validates :subject, presence: true
    validates :location, presence: true
    validates :time, presence: true
    validates :duration, presence: true
    scope :available, -> { where("booked == false") }

    belongs_to :instructor, class_name: "User"
    belongs_to :student, class_name: "User", optional: true

end