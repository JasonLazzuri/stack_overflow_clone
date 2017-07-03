# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   questions = Question.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', question: questions.first)

Question.destroy_all
Answer.destroy_all

50.times do |index|

  new_user = User.create!(email: Faker::Internet.email)
  new_question = Question.create!(title: Faker::Hipster.word,
                content: Faker::Hipster.paragraphs(2),
  )

  rand(1..10).times do |answer|
    Answer.create!(
    body: Faker::Hipster.word,
    question_id: new_question.id,
    analysis: Faker::Hipster.paragraph(2)
    )
  end
end

p "Created #{Question.count} questions"
