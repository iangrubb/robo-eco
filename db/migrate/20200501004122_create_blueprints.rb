class CreateBlueprints < ActiveRecord::Migration[6.0]
  def change
    create_table :blueprints do |t|
      t.integer :effective_production_time
      t.belongs_to :robot, null: false, foreign_key: true
      t.belongs_to :product_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
