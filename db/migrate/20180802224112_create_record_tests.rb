class CreateRecordTests < ActiveRecord::Migration[5.2]
  def change
    create_table :record_tests do |t|
      t.references :record, foreign_key: true
      t.references :test, foreign_key: true

      t.timestamps
    end
  end
end
