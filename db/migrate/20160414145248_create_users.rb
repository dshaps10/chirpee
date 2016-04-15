class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :last_name
  		t.string :first_name
  		t.string :handle
  		t.string :email
  		t.string :city
  		t.string :state
  		t.string :country
      t.integer :followee_id
  		t.string :password_hash

  		t.timestamps null: false
  	end
  end
end
