class CreateRecordXrays < ActiveRecord::Migration[5.2]
  def change
    create_table :record_xrays do |t|
      t.references :record, foreign_key: true
      t.references :xray, foreign_key: true

      t.timestamps
    end
  end
end
