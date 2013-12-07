class RecipeTool < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :tool
end
