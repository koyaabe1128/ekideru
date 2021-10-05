class CreateExits < ActiveRecord::Migration[5.2]
  def change
    create_table :exits do |t|
      t.string :number

      t.timestamps
    end
  end
end
