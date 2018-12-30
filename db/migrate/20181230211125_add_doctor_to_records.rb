class AddDoctorToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :doctor, :string
  end
end
