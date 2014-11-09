class AddCategoryIdToTreatments < ActiveRecord::Migration
  def change
    add_column :treatments, :category_id, :integer
  end
end
