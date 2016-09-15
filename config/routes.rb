Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users

	resources :categories do
    get '/sort_by_date', to: 'categories#sort_by_date'
    get '/sort_by_score', to: 'categories#sort_by_score'
  end
	resources :posts do
    delete 'image/:id' => 'posts#destroy_image', as: 'destroy_image'
		resources :post_sections
    resources :comments
  end
  resources :invitations, only: [:create]
  get 'tags/:name' => 'tags#show', as: 'show_tag'

	get '/about', to: 'main#about'
	root 'main#main'
end
