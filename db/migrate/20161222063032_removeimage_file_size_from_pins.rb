class RemoveimageFileSizeFromPins < ActiveRecord::Migration
  def change
  	remove_column :pins, :image_file_size, :string
  end
end
