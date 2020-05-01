class CreateProductionOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :production_orders do |t|
      t.integer :remaining_production_time
      t.belongs_to :blueprint, null: false, foreign_key: true

      t.timestamps
    end
  end
end
