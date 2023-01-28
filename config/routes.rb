Rails.application.routes.draw do
  get 'likes/create'
  get 'comments/create'
  root 'users#index'
  get 'users/index'
  get 'users/show'
  get 'posts/index'
  get 'posts/show'
  resources :users, only: [:index, :show] do
  resources :posts, only: [:index, :show, :new, :create]
  end   
 

  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create] 
  end
end
