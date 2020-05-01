class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.belongs_to :robot, null: false, foreign_key: true
      t.references :connected_robot, null: false

      t.timestamps
    end
  end
end
