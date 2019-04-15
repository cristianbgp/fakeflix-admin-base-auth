class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.integer :paid_price
      t.references :rentable, polymorphic: true

      t.timestamps
    end
  end
end
