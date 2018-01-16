class AddIndexToUsersLogin < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :login, unique: true
  end
end
