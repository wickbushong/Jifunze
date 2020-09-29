class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.integer :instructor_id, foreign_key: true
      t.integer :student_id, foreign_key: true, default: 1
      t.datetime :time
      t.integer :duration
      t.string :subject
      t.boolean :booked, default: false
      t.string :location
      t.text :notes

      t.timestamps
    end
  end
end
