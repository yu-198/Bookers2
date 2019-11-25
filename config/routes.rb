Rails.application.routes.draw do
  devise_for :users
  root 'root#top'
  get 'home/about' =>'root#show'
  # delete 'books/:id', to: 'books#destroy'
  resources :books
  resources :users
  resources :post_images, only: [:new, :create, :index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
