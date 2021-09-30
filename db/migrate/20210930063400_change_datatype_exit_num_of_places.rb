class ChangeDatatypeExitNumOfPlaces < ActiveRecord::Migration[5.2]
  def change
    change_column :places, :exit_num, :integer
  end
end
