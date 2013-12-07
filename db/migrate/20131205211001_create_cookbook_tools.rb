class CreateCookbookTools < ActiveRecord::Migration
  def change
    create_table :cookbook_tools do |t|
      t.integer :cookbook_id
      t.integer :tool_id

      t.timestamps
    end
  end
end
