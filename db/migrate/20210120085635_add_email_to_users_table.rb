class AddEmailToUsersTable < ActiveRecord::Migration[5.2]
  def change
  	drop_table :users
  	#add_column :users, :email, :string, after: 'username'
  	#add_column :users, :password, :string, after: 'email'
  end
end
