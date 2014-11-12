class AddSlugToTreatments < ActiveRecord::Migration
  def change
    add_column :treatments, :slug, :string
    add_index :treatments, :slug, unique: true
  end
end
