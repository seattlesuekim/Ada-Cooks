class Recipe < ActiveRecord::Base

  attr_accessor :matches

  has_many :cookbook_recipes
  has_many :cookbooks, through: :cookbook_recipes
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_tools
  has_many :tools, through: :recipe_tools

  def self.ingredients_match(search)
    @matches = includes(:ingredients).where(ingredients: {name: search})
  end

end
