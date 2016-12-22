class RemoveImageFileNameFromPins < ActiveRecord::Migration
  def change
    remove_column :pins, :image_file_name, :string
  end
end
