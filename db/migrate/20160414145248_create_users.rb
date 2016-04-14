class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :user do |t|
  		t.string :last_name
  		t.string :first_name
  		t.string :handle
  		t.string :email
  		t.string :city
  		t.string :state
  		t.string :country
  		t.string :password_hash

  		t.timestamps null: false
  	end
  end
end
