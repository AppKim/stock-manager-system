Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, { format: 'json' } do
    get 'role' => 'roles#index'
    resources :products, only: %i[index show create update destroy]
    resources :brands, only: %i[index create update]
    get 'stocks' => 'stocks#index'
  end
end
