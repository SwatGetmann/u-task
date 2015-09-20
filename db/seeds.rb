# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create([{ name: "C++" }, { name: "Java" }, { name: "Python" }, { name: "Ruby" }])
Level.create([{ name: "Easy", value: 1 }, { name: "Medium", value: 3 }, { name: "Hard", value: 5 }, 
	{ name: "Сука тяжко", value: 7 }, { name: "Пожизненное наказание", value: 10 }])