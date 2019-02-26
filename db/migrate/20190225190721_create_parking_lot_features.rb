class CreateParkingLotFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_lot_features do |t|
      t.references :parking, foreign_key: true
      t.references :feature, foreign_key: true

      t.timestamps
    end
  end
end
