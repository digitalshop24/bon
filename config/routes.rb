Rails.application.routes.draw do
	resources :categories
	resources :posts
	get '/about', to: 'main#about'
	root 'posts#index'
end
