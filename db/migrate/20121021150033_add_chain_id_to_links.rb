class AddChainIdToLinks < ActiveRecord::Migration
  def change
    add_column :links, :chain_id, :integer
  end
end
