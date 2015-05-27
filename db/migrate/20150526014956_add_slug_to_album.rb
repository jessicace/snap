class AddSlugToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :slug, :text
  end
end
