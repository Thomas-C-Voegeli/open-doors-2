class CreateDoors < ActiveRecord::Migration[5.0]
  def change
    create_table :doors do |t|
      t.string :country
      t.string :state
      t.string :city
      t.string :street
      t.string :street_number
      t.string :zipcode

      t.timestamps
    end
  end
end
