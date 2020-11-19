# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## how to create a User
# User.create(first_name:'James',last_name:'Dole')

## how to create a Course
# this create a instance of course does not save to db
# course = Course.new(name:'Javascript 101')
# course.save # saves to db

# Course.create(name:'ruby 101')

# how to create enrollement via Enrollment class

# user with id 1 and course with id 1 must exist
# Enrollment.create(role:'Student', user_id:1, course_id:1)

# how to create enrollement via instance of User class
# user =  User.create(first_name:'James',last_name:'Dole')
# user.enrollments.create(role:'TA', course_id:1)

# how to create enrollement via instance of Course class
# user =  User.create(first_name:'James',last_name:'Dole')
# course = Course.create(name:'Rails 101')
# course.enrollments.create(role:'TA', user_id: user.id)

# how to access enrollments
# user.enrollments # give all the enrollments for a given user
# course.enrollments # give all user for given course

# how to upate Enrollment  via Enrollment class
# how to upate Enrollment  via instance of Enrollment class
# how to get users enrollments for one user
# how to get course enrollemnt for one course

users = []
courses = []
roles = ["student", "ta", "teacher"]

# create 30 users push them on users array
30.times do |i|
  users << User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

# create 3 course push them on course array
3.times do |i|
  courses << Course.create(name: Faker::Educator.course_name)
end

# go through each course and add 10 enrollments
courses.each do |course|
  10.times do
    # Enrollment.create(role: roles.sample, user_id: users.sample.id, course_id:course.id )
    course.enrollments.create(role: roles.sample, user_id: users.sample.id)
  end
end

puts "seeded"
puts Course.all.size # 3
puts User.all.size # 30
puts Enrollment.all.size #  3 * 10 = 30

# q
User.first.enrollments.first.course.name

User.first = User.first.enrollments.first.user
