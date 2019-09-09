class ChangeColumnNameAgain < ActiveRecord::Migration[6.0]
  def change
    rename_column :favourites, :location_type, :location_name
  end
end
