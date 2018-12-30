class AddRatingToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :rating, :string
  end
end
