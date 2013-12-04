class Recipe < ActiveRecord::Base
  has_many :ingredients, through: :cookbooks_recipeses
  has_many :tools
end
