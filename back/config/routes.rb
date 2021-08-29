Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, { format: 'json' } do
    get "role" => "roles#index"
    get "brand" => "brands#index"
    resources :products
    get "stock" => "stocks#index"
  end
end
