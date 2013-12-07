class CreateRecipeTools < ActiveRecord::Migration
  def change
    create_table :recipe_tools do |t|

      t.timestamps
    end
  end
end
