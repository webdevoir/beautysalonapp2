class AddVisibleToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :visible, :boolean
  end
end
