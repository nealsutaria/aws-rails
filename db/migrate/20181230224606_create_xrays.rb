class CreateXrays < ActiveRecord::Migration[5.2]
  def change
    create_table :xrays do |t|
      t.string :name

      t.timestamps
    end
  end
end
