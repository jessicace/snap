class AddImageToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :image, :text
  end
end
