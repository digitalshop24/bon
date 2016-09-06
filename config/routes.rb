Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
	resources :categories
	resources :posts
	mount Ckeditor::Engine => '/ckeditor'
	get '/about', to: 'main#about'
	root 'posts#index'
end
