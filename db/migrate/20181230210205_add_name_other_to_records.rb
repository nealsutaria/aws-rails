class AddNameOtherToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :name_other, :string
  end
end
