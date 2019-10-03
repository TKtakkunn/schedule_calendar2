Rails.application.routes.draw do
  get 'passwords/edit'
  get 'accounts/show'
  get 'accounts/edit'
  resources :meetings
  resources :members do
    get "search", on: :collection
  end
  resource :session
  resource :account, only: [:show, :edit, :update]
  resource :password, only: [:show, :edit, :update]
  root "sessions#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
