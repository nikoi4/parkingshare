class AddPicturesToParkings < ActiveRecord::Migration[5.2]
  def change
    add_column :parkings, :pictures, :json
  end
end
