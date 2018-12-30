class AddPrescriptiontypeToRecords < ActiveRecord::Migration[5.2]
  def change
    add_reference :records, :prescriptiontype, foreign_key: true
  end
end
