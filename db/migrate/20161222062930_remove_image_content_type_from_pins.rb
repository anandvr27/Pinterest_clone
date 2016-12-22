class RemoveImageContentTypeFromPins < ActiveRecord::Migration
  def change
    remove_column :pins, :image_content_type, :string
  end
end
