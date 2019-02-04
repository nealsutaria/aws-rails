class AddVaccineToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :vaccine, :string
  end
end
