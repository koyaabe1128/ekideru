class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.references :place, foreign_key: true
      t.references :exit, foreign_key: true

      t.timestamps
      
      t.index [:place_id, :exit_id], unique: true
    end
  end
end
