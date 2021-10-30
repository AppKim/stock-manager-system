Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, { format: 'json' } do
    get 'role' => 'roles#index'
    # get "demo/hello" => "your-controller#your/action"
    # get 'stock/detail' => 'stocks#detail'
    resources :products, only: %i[index create update destroy]
    resources :brands, only: %i[index create update]
    resources :stocks, only: %i[index create detail]
  end
end
