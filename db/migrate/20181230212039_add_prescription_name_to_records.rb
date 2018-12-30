class AddPrescriptionNameToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :prescription_name, :string
  end
end
