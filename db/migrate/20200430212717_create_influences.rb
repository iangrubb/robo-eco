class CreateInfluences < ActiveRecord::Migration[6.0]
  def change
    create_table :influences do |t|
      t.integer :strength
      t.references :influencing_robot, null: false
      t.references :influenced_robot, null: false

      t.timestamps
    end
  end
end
