class CookbookTool < ActiveRecord::Base
  belongs_to :cookbook
  belongs_to :tool
end
