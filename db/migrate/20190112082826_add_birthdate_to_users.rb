class AddBirthdateToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthdate, :string
  end
end
