class CreateTweets < ActiveRecord::Migration
  def change
  	create_table :tweets do |t|
  		t.belongs_to :user, index: true
  		t.string :body
  		t.integer :likes, default: 0

  		t.timestamps null: false
  	end
  end
end
