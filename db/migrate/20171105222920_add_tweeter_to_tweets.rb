class AddTweeterToTweets < ActiveRecord::Migration[5.1]
  def change
    add_reference :tweets, :tweeter, foreign_key: true
  end
end
