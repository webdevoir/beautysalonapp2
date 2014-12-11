class AddSummaryToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :summary, :text
  end
end
