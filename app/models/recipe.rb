class Recipe < ActiveRecord::Base
  belongs_to :cookbook
  has_many :ingredients
  has_many :tools
end
