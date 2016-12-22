class RemoveImageUpdatedAtFromPins < ActiveRecord::Migration
  def change
    remove_column :pins, :image_updated_at, :datetime
  end
end
