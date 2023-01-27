Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end

=======
>>>>>>> parent of a6bb258 (Merge pull request #5 from MahdiAghaali/feature/routes)
=======
>>>>>>> parent of a6bb258 (Merge pull request #5 from MahdiAghaali/feature/routes)
end
