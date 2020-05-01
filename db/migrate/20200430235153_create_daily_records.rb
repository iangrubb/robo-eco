class CreateDailyRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_records do |t|
      t.integer :total_satisfaction
      t.string :activity
      t.belongs_to :robot, null: false, foreign_key: true
      t.belongs_to :day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
