class Cookbook < ActiveRecord::Base
  belongs_to :user
  has_many :cookbook_recipes
  has_many :recipes, through: :cookbook_recipes
  has_many :cookbook_tools
  has_many :tools, through: :cookbook_tools
end
