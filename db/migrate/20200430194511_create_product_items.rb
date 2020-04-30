class CreateProductItems < ActiveRecord::Migration[6.0]
  def change
    create_table :product_items do |t|
      t.integer :current_durability
      t.belongs_to :robot, null: false, foreign_key: true
      t.belongs_to :product_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
