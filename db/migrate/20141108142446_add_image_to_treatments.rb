class AddImageToTreatments < ActiveRecord::Migration
  def change
    add_column :treatments, :image, :string
  end
end
