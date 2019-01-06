class AddDateToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :date, :datetime
  end
end
