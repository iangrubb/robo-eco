class CreateShippingOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_orders do |t|
      t.belongs_to :connection, null: false, foreign_key: true
      t.references :dependency, polymorphic: true, null: false

      t.timestamps
    end
  end
end
