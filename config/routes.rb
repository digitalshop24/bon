Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users

	resources :categories do
    get '/sort_by_date', to: 'categories#sort_by_date'
    get '/sort_by_score', to: 'categories#sort_by_score'
  end
	resources :posts do
		resources :post_sections
  end


	get '/about', to: 'main#about'
	root 'posts#index'
end
