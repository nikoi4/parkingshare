class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :status
      t.string :car_plate
      t.datetime :start_date
      t.datetime :end_date
      t.string :price_cents
      t.references :parking, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
