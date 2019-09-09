class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :favourites, :type, :location_type
  end
end
