Rails.application.routes.draw do
  resources :meetings
  root 'meetings#index'
  resources :members do
    get "search", on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:create, :destroy]
end
