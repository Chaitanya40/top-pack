class AddCountToPackage < ActiveRecord::Migration[5.0]
  def change
  	add_column :packages, :count, :integer, :default => 0
  end
end
