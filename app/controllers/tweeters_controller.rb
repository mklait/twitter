class TweetersController < ApplicationController
	before_action :authenticate_tweeter!, only: [:follow]
def show
	@tweeter = Tweeter.find(params[:id])
	@tweets = @tweeter.tweets
end 

def follow
	@tweeter = Tweeter.find(params[:id])
	current_tweeter.following_tweeters << @tweeter
	redirect_to show_user_url(@tweeter)
end 
end
