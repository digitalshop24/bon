Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users

	resources :categories
	resources :posts
	resources :post_sections

	get '/about', to: 'main#about'
	root 'posts#index'
end
