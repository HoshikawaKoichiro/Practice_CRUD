Rails.application.routes.draw do
  resources :blogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books
  resources :novels
  resources :comics
  resources :notes
  resources :buckets
  resources :pockets
  resources :bridges
  resources :woods
  resources :kiwis
  resources :bananas
  resources :pears
  resources :pastas
end
