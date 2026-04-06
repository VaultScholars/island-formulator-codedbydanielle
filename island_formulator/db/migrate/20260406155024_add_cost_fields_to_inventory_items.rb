class AddCostFieldsToInventoryItems < ActiveRecord::Migration[8.1]
  def change
    add_column :inventory_items, :cost, :decimal
    add_column :inventory_items, :unit_size, :decimal
    add_column :inventory_items, :unit, :string
  end
end
