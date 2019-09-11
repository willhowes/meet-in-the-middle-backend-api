class AddHomeLocationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :home_location, :string
  end
end
