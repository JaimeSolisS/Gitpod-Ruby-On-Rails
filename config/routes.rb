Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.
  Rails.application.routes.draw do
  get "/tweets" => "tweets#index", as: :tweets
  resources :users do
    resources :tweets
  end

end
end
