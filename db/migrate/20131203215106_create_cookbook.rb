
class CreateCookbook < ActiveRecord::Migration
  def change
    create_table "cookbooks", force: true do |t|
      t.string   "recipe"
      t.string   "ingredient"
      t.string   "tool"
      t.datetime "created_at"
      t.datetime "updated_at"

    end
  end
end
