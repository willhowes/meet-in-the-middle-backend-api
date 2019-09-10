class AddWorkLocationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :work_location, :string
  end
end
