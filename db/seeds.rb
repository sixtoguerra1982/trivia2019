# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: "admin@trivia.cl", name: "Administrador", password: "admin123", rol: 0)
User.create!(email: "sixto@gmail.com", name: "Sixto Guerra", password: "123123")
10.times do |i|
  Question.create!(description: "#{i+1} + #{i+1}")
  Answer.create!(answer: (i + 1) + (i + 1) , question_id: i+1 , tipo: true)
  4.times do |x|
    Answer.create!(answer: (x+1 * i+1) * 3 , question_id: i+1 , tipo: false)
  end
end
