class AddNameToCookbookString < ActiveRecord::Migration
  def change
    change_column(:cookbooks, :name, :string)
  end
end
