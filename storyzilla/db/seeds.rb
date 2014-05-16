# require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Contribution.delete_all
Story.delete_all
User.delete_all

user = User.new(username: 'david', email: "david@notreal.com", 
    password: 'password', password_confirmation: 'password')
user.save 

my_book = []

20.times do |index|
  my_book << Story.create(title: "This is my story Chapter " + index.to_s, beginning: "Once upon A time...", user: user)
end

my_book.each do |story|
  prior_contribution = nil
  5.times do |index|
    prior_contribution = Contribution.create(body: "...and one time in band camp...", 
      story: story, user: user, parent: prior_contribution)
  end
end

