class RemoveUserIdFromTweets < ActiveRecord::Migration[5.1]
  def change

  	remove_column :tweets, :user_id, :integer
   end
  end
end 
