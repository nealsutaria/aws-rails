class AddKarmaToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :karma, :integer, default: 0
  end
end

