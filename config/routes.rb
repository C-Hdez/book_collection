Rails.application.routes.draw do
  root "main#index"

  get 'books/index'
  get 'books/new'
  get 'books/edit'
  get 'books/delete'
  get 'books/show'



  # match 'about', to "main#index", via: :get

  get 'main/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
