class AddSessionKeyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :session_key, :string
  end
end
