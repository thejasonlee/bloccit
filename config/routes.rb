Bloccit::Application.routes.draw do

  get "comments/create"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]
    end
  end

  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end
