# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Question.destroy_all
Answer.destroy_all
Vote.destroy_all
Comment.destroy_all

#Create Users
User.create(name:'Juan David', email:'rangeljdr@gmail.com', password: "123456", password_confirmation: "123456")
User.create(name:'Dumar', email:'dumarojeda@gmail.com', password: "123456", password_confirmation: "123456")
User.create(name:'Juan', email: "j.gomez267@gmail.com", password: "123456", password_confirmation: "123456")
User.create(name:'Diana', email: "dalvarez131@gmail.com", password: "123456", password_confirmation: "123456")
User.create(name:'Miguel', email: "msoler735@gmail.com", password: "123456", password_confirmation: "123456")
User.create(name:'Roberto', email: "rueda.roberto89@gmail.com", password: "123456", password_confirmation: "123456")
User.create(name:'Melissa', email: "melissa166@gmail.com", password: "123456", password_confirmation: "123456")
User.create(name:'Victor', email: "vialfonsuo@gmail.com", password: "123456", password_confirmation: "123456")
User.create(name:'Nicolas', email: "nicolaspovedas@gmail.com", password: "123456", password_confirmation: "123456")

# Create Questions
(1..9).each do |i|
  Question.create(title:Faker::Book.title, description:Faker::ChuckNorris.fact, user_id: i)
end

# Create Answers
(1..9).each do |i|
  Answer.create!(description: Faker::ChuckNorris.fact, question_id: Question.all.pluck(:id).sample, user_id: User.all.pluck(:id).sample)
end

# Create Votes for questions
(1..9).each do |i|
  Vote.create!(votable_id: Question.all.pluck(:id).sample, votable_type:"Question", user_id: User.all.pluck(:id).sample)
end

# Create Votes for answers
(1..9).each do |i|
  Vote.create!(votable_id: Answer.all.pluck(:id).sample, votable_type:"Answer", user_id: User.all.pluck(:id).sample)
end

# Create comments for questions
(1..9).each do |i|
  Comment.create!(description: Faker::StarWars.quote, commentable_id: Question.all.pluck(:id).sample, commentable_type: "Question", user_id: User.all.pluck(:id).sample )
end

# Create comments for answers
(1..9).each do |i|
  Comment.create!(description:Faker::StarWars.quote, commentable_id: Answer.all.pluck(:id).sample, commentable_type: "Answer", user_id: User.all.pluck(:id).sample)
end
