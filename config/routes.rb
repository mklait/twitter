Rails.application.routes.draw do
root to: "tweets#index"
		

  devise_for :tweeters


		resources :tweets do
		get 'dashboard', on: :collection, to: 'tweets#index', as: :dashboard
						end 


 
end
 