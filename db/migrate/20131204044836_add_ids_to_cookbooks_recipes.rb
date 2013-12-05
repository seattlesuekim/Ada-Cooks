class AddIdsToCookbooksRecipes < ActiveRecord::Migration
  def change
    add_column(:cookbook_recipes, :cookbook_id, :integer)
    add_column(:cookbook_recipes, :recipe_id, :integer)
  end
end
