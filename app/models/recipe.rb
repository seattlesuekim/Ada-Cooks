class Recipe < ActiveRecord::Base
  has_many :cookbook_recipes
  has_many :cookbooks, through: :cookbook_recipes
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :tools
end
