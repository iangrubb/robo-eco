class CreateProductTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :product_types do |t|
      t.string :name
      t.integer :max_durability
      t.integer :base_production_time

      t.timestamps
    end
  end
end
