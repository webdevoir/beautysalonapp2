class RenameTreatsToTreatments < ActiveRecord::Migration
  def change
    rename_table :treats, :treatments
  end
end
