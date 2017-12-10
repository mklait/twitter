class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.references "tweeters"	
      t.string "post"	
      t.timestamps
    end
  end
end
