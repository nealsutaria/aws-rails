class CreateRecordPrescriptionTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :record_prescription_types do |t|
      t.references :record, foreign_key: true
      t.references :prescriptiontype, foreign_key: true

      t.timestamps
    end
  end
end
