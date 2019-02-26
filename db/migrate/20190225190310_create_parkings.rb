class CreateParkings < ActiveRecord::Migration[5.2]
  def change
    create_table :parkings do |t|
      t.string :description
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :picture
      t.string :size
      t.string :price_cents
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
