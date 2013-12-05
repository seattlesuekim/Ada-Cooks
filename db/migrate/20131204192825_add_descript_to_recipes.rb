class AddDescriptToRecipes < ActiveRecord::Migration
  def change
    add_column(:recipes, :description, :text)
    add_column(:recipes, :method, :text)
    add_column(:recipes, :vegan, :boolean)
    add_column(:recipes, :vegetarian, :boolean)
    add_column(:recipes, :GF, :boolean)
  end
end
