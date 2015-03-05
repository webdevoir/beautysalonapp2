class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :sections, :category_id
    add_index :treatments, :category_id
  end
end
