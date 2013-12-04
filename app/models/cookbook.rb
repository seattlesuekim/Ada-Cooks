class Cookbook < ActiveRecord::Base
  belongs_to :user
  has_many :cookbook_recipes
  has_many :recipes, through: :cookbook_recipes
end
