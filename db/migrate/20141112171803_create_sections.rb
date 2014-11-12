class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :category_id
    end
  end
end
