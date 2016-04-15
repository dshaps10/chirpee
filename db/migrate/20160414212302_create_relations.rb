class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.references :follower
      t.references :followee
    end
  end
end
