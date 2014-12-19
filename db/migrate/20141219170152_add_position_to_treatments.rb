class AddPositionToTreatments < ActiveRecord::Migration
  def change
    add_column :treatments, :position, :integer
  end
end
