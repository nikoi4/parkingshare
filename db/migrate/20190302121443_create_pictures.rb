class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :picture
      t.references :parking, foreign_key: true

      t.timestamps
    end
  end
end
