class Recipe < ActiveRecord::Base
  has_many :cookbooks, through: :cookbook_recipes
  has_many :ingredients, through: :recipe_ingredients
  has_many :tools
end
