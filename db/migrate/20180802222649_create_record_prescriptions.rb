class CreateRecordPrescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :record_prescriptions do |t|
      t.references :record, foreign_key: true
      t.references :prescription, foreign_key: true

      t.timestamps
    end
  end
end
