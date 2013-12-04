class Cookbook < ActiveRecord::Base
  belongs_to :user
  has_many :recipes, through: :cookbooks_recipeses
end
