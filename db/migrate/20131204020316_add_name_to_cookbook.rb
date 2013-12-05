class AddNameToCookbook < ActiveRecord::Migration
  def change
    add_column(:cookbooks, :name, :integer)
  end
end
