class CreateIntrinsicDesires < ActiveRecord::Migration[6.0]
  def change
    create_table :intrinsic_desires do |t|
      t.integer :strength
      t.belongs_to :robot, null: false, foreign_key: true
      t.belongs_to :product_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
