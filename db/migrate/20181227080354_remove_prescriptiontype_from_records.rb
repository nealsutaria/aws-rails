class RemovePrescriptiontypeFromRecords < ActiveRecord::Migration[5.2]
  def change
    remove_reference :records, :prescriptiontype, foreign_key: true
  end
end
