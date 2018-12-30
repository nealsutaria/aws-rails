class CreatePrescriptiontypes < ActiveRecord::Migration[5.2]
  def change
    create_table :prescriptiontypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
