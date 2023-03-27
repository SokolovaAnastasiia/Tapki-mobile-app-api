# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb

parent_task = Task.create!(name: "Сдать английский")
Task.create!(name: "Грамматика", parent_id: parent_task.id)
Task.create!(name: "Чтение", parent_id: parent_task.id)
Task.create!(name: "Слушание", parent_id: parent_task.id)
Task.create!(name: "Письмо", parent_id: parent_task.id)

# Task.delete_all