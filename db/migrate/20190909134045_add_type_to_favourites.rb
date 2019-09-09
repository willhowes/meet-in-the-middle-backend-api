class AddTypeToFavourites < ActiveRecord::Migration[6.0]
  def change
    add_column :favourites, :type, :string
  end
end
