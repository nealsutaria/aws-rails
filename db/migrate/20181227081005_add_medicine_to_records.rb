class AddMedicineToRecords < ActiveRecord::Migration[5.2]
  def change
    add_reference :records, :medicine, foreign_key: true
  end
end
