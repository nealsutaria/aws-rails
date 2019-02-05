class AddVaccineOtherToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :vaccine_other, :string
  end
end
