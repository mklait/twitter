class HashtagsTweets < ActiveRecord::Migration[5.1]
  def change
  	create_table :hashtags_tweets, id: false do |t|
  		t.belongs_to :hashtag, index: true
  		t.belongs_to :tweet, index: true

  end

add_index(:tweets, :created_at)
	end
end
