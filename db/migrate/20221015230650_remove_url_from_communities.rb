class RemoveUrlFromCommunities < ActiveRecord::Migration[5.2]
  def change
    remove_column :communities, :url, :string
  end
end
