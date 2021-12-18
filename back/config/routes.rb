Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, { format: 'json' } do
    get 'role' => 'roles#index'
    get 'products/search' => 'products#show'
    resources :products, only: %i[index create update destroy]
    resources :brands, only: %i[index create update]
    resources :categories, only: %i[index]
    resources :stocks, only: %i[index create detail]
    get 'stocks' => 'stocks#index'
    get 'stocks/search' => 'stocks#search'
    get 'stock/detail' => 'stocks#detail'
  end
end
