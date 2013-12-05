class CreateCookbooksRecipes < ActiveRecord::Migration
  def change
    create_table :cookbook_recipes do |t|

      t.timestamps
    end
  end
end
