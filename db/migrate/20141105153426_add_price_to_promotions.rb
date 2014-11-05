class AddPriceToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :price, :decimal, :precision => 8, :scale => 2
  end
end
