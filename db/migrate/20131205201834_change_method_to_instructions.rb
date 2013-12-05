class ChangeMethodToInstructions < ActiveRecord::Migration
  def change
    rename_column :recipes, :method, :instructions
  end
end
