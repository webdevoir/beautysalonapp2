class AddPromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :title
      t.string :tagline
      t.text   :description
      t.string :image

      t.timestamps
    end
  end
end
