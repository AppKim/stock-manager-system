Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, { format: 'json' } do
<<<<<<< HEAD
    get "role" => "roles#index"
    get "brand" => "brands#index"
    resources :products
    get "stock" => "stocks#index"
=======
    get 'role' => 'roles#index'
    resources :products, only: %i[index create update]
    get 'stock' => 'stocks#index'
>>>>>>> b5cb0548ad1d6a7f1f8c1683a0f197a7c78be3d5
  end
end
