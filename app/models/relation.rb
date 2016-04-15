class Relation < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :followee, foreign_key: "followee_id", class_name: "User"
  belongs_to :follower, foreign_key: "follower_id", class_name: "User"

end
