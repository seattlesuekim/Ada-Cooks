class CookbookRecipe < ActiveRecord::Base
  belongs_to :cookbook
  belongs_to :recipe
end
