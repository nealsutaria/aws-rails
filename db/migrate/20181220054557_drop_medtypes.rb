class DropMedtypes < ActiveRecord::Migration[5.2]
  def change
    drop_table :medtypes
  end
end
