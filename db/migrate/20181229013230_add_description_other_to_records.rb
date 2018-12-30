class AddDescriptionOtherToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :description_other, :string
  end
end
