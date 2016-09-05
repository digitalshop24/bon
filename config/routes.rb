Rails.application.routes.draw do
	resources :categories
	resources :posts
	mount Ckeditor::Engine => '/ckeditor'
	get '/about', to: 'main#about'
	root 'posts#index'
end
