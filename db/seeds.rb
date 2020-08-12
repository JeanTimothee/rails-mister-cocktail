# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts "---Destroying all Ingredients---"
Ingredient.destroy_all
puts "-----Ingredients destroyed!-----"
puts ""

puts "------Creating Ingredients------"
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)
ingredients["drinks"].each { |ingredient| Ingredient.create(name: ingredient["strIngredient1"])}
puts "----#{Ingredient.all.count} Ingredients Created!----"

puts "----Destroying all Cocktails----"
Cocktail.destroy_all
puts "------Cocktails Destroyed!------"
puts ""

puts "-------Creating Cocktails-------"
cocktail_names = ["Bloody Mary", "Gazpacho Peel", "Mauresque", "Vodka Martini", "Ti'punch"]
cocktail_names.each { |cocktail_name| Cocktail.create(name: cocktail_name) }
puts "-------#{Cocktail.all.count} Cocktails Created!------"
