class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.string :image
      t.integer :kind
      t.string :exit_num
      t.string :yomigana

      t.timestamps
    end
  end
end
