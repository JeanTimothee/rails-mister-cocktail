# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'


url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

ingredients_serialized = open(url).read

ingredients = JSON.parse(ingredients_serialized)["drinks"]

ingredients.each do |ingredient|
  t = Ingredient.new(name: ingredient["strIngredient1"])
  t.save
end


# Cocktail.new(name: "Sky coke")
# Cocktail.new(name: "Gazpacho Peel")
# Cocktail.new(name: "Vodka Martini (spoon)")
# Cocktail.new(name: "Cointreau ananas")

# dose = Dose.create(description: "6cl", cocktail_id: , ingredient_id:)

# Faker::Food.measurement #=> "1/4 tablespoon"
