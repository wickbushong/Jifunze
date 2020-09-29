# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
    name: "dummy_student",
    email: "fake@school.edu",
    password: "password",
    instructor: false
)

User.create(
    name: "wick",
    email: "wickbushong@gmail.com",
    password: "password",
    instructor: true
)

User.create(
    name: "second_student",
    email: "second@school.edu",
    password: "password",
    instructor: false
)

User.create(
    name: "second_instructor",
    email: "teacher2@school.edu",
    password: "password",
    instructor: true
)

Lesson.create(
    instructor_id: 2,
    time: Time.new(2020, 12, 25, 5, 30),
    duration: 30,
    subject: "Physics",
    location: "library (restricted section)",
    notes: "Bring your calculator"
)

Lesson.create(
    instructor_id: 4,
    time: Time.new(2020, 11, 20, 11, 30),
    duration: 30,
    subject: "Spanish",
    location: "TBD",
    notes: "Hola. Que tal"
)


