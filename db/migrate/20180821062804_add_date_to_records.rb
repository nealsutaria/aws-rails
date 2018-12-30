class AddDateToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :pick_time, :datetime
  end
end
