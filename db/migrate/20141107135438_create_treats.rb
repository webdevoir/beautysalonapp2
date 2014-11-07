class CreateTreats < ActiveRecord::Migration
  def change
    create_table :treats do |t|
      t.string :title
      t.string :tagline
      t.text :summary
      t.text :description
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
