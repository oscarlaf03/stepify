
require 'faker'
puts 'creating users'
array_users = []
7.times do
  a_user = User.new
  faker_name = Faker::StarWars.character.split(' ')
  a_user.first_name = faker_name[0]
  a_user.last_name = faker_name[1]
  a_user.email = Faker::Internet.safe_email("#{a_user.first_name}")
  a_user.password = '123123'
  a_user.save
  array_users << a_user
end

puts "#{User.count} users created "

array_steplists = []

puts 'creating steplists'

array_users.each do |user|
  a_steplist = Steplist.new
  a_steplist.user = user
  a_steplist.title = Faker::Hipster.sentence(3)
  a_steplist.description = Faker::Hipster.paragraph
  a_steplist.save
  array_steplists << a_steplist
end

puts "#{Steplist.count} steplists creeated"

puts 'creating steps for steplists'


array_steplists.each do |steplist|
  rand(3..6).times do
    a_step = Step.new
    a_step.steplist = steplist
    a_step.title = Faker::Lorem.sentence
    a_step.description = Faker::Lorem.paragraph
    a_step.save
  end
end

puts "#{Step.count} steps created"

puts 'creating root power users'

oscar = User.new
oscar.password = '123123'
oscar.first_name = 'oscar'
oscar.last_name = 'teste'
oscar.email = 'oscar@teste.com'
oscar.save

miguel = User.new
miguel.password = '123123'
miguel.first_name = 'miguel'
miguel.last_name = 'teste'
miguel.email = 'miguel@teste.com'
miguel.save

Steplist.all[0].update(user: oscar)
Steplist.all[1].update(user: miguel)

puts 'All tasks finalized'