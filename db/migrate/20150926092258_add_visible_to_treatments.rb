class AddVisibleToTreatments < ActiveRecord::Migration
  def change
    add_column :treatments, :visible, :boolean
  end
end
