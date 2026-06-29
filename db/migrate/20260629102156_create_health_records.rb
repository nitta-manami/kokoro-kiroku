class CreateHealthRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :health_records do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
