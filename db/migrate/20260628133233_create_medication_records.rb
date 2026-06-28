class CreateMedicationRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :medication_records do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :recorded_at
      t.integer :status

      t.timestamps
    end
  end
end
