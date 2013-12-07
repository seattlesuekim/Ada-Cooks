class AddIdsToRecipeTools < ActiveRecord::Migration
  def change
    add_column(:recipe_tools, :recipe_id, :integer)
    add_column(:recipe_tools, :tool_id, :integer)
  end
end
