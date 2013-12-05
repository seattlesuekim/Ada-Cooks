class AddQtyToIng < ActiveRecord::Migration
  def change
    add_column(:ingredients, :qty, :string)
  end
end
