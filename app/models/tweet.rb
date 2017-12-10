class Tweet < ApplicationRecord
before_save :generate_hashtags

belongs_to :tweeter
has_and_belongs_to_many :hashtags


def owned_by?(tweeter)
	return tweeter && tweeter == self.tweeter
end

def generate_hashtags
	content.scan(/#\w+/).each do |tag|
	hashtag = Hashtag.find_or_create_by(tag: tag)
	self.hashtags << hashtag
	end 
  end 

def owned_by?(tweeter)
	return tweeter && tweeter == self.tweeter
  end
end 

