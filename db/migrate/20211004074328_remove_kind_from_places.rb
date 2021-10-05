class RemoveKindFromPlaces < ActiveRecord::Migration[5.2]
  def change
    remove_column :places, :kind, :integer
  end
end
