class RemoveExitNumFromPlaces < ActiveRecord::Migration[5.2]
  def change
    remove_column :places, :exit_num, :integer
  end
end
