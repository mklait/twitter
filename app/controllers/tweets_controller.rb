class TweetsController < ApplicationController

	before_action :authenticate_tweeter!, except: [:dashboard, :index, :show]
	before_action :set_tweet, only: [:show, :edit, :update, :destroy]
	before_action :check_correct_tweeter, only: [:edit, :update, :destroy]

	def index
		
		@tweets = Tweet.order(:created_at).limit(20)

	end 

	def new
		@tweet = Tweet.new
	end


	def create
		@tweet = Tweet.new(tweet_params)
		@tweet.tweeter = current_tweeter
		

		respond_to do |format|
			if @tweet.save
				format.html {redirect_to @tweet, notice: 'Your tweet was successfully posted.'}
				format.json {render :show, status: :creation, location: @tweet}
			else
				format.html {render :new}
				format.json {render json: @tweet.errors, status: :unprocessable_entity}				
			end
		end
	end

	def edit

	end

	def update
		respond_to do |format|
			if @tweet.update(tweet_params)

				 
				format.html {redirect_to @tweet, notice: "Your tweet was updated!"}
				format.json {render :show, status: :ok, location: @tweet}
			else
				format.html {render :edit}
				format.json {render json: @tweet.errors, status: :unprocessable_entity}
			end 
		end
	end

	def destroy
		@tweet.destroy
		respond_to do |format|
			format.html {redirect_to tweets_url, notice: 'Tweet was destroyed!'}
			format.json {head :no_content}
		end
	end 
 
	
	def dashboard
		if current_tweeter
			@tweets = current_tweeter.tweets

		else
			@tweets = Tweet.all
		end 
		render :index
	end 

	private

	def set_tweet
		@tweet = Tweet.find(params[:id])
	end

	def tweet_params
		params.require(:tweet).permit(:content)
	end

	def check_correct_tweeter

	end
	
end
