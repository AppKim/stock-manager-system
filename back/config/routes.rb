Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, { format: 'json' } do
    get 'role' => 'roles#index'
    get 'products/search' => 'products#show'
    resources :products, only: %i[index create update destroy]
    resources :brands, only: %i[index create update]
    get 'stocks' => 'stocks#index'
  end
end
