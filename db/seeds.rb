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
    name: "bill_nye_tsg",
    email: "bill@science.com",
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
    name: "other_tutor",
    email: "teacher2@school.edu",
    password: "password",
    instructor: true
)

User.create(
    name: "Snape",
    email: "halfbloodprince@hogwarts.edu",
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
    instructor_id: 2,
    time: Time.new(2020, 12, 26, 5, 30),
    duration: 30,
    subject: "Physics",
    location: "library (restricted section)",
    notes: "Bring your calculator"
)

Lesson.create(
    instructor_id: 2,
    time: Time.new(2020, 12, 27, 5, 30),
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

Lesson.create(
    instructor_id: 2,
    time: Time.new(2020, 11, 21, 11, 30),
    duration: 60,
    subject: "French",
    location: "France",
    notes: "Ceci n'est pas une 
    leçon"
)

Lesson.create(
    instructor_id: 5,
    time: Time.new(2020, 11, 21, 11, 30),
    duration: 60,
    subject: "Potions",
    location: "Hogwartz",
    notes: "no silly incantations"
)

    


