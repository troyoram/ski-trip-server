class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      # add ', null: false' to prevent SQL record creation
      # if values aren't present
      t.string :location, null: false
      t.date :date, null: false
      t.string :equipment, null: false

      t.timestamps
    end
  end
end
