class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :carno
      t.string :cartype
      t.bigint :driverphn
      t.string :destination
      t.integer :seats
      t.string :time
      t.boolean :complete
      t.references :customer, foreign_key: true
      t.integer :seatsleft

      t.timestamps
    end
  end
end
