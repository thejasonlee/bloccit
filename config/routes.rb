Bloccit::Application.routes.draw do
  devise_for :users
resources :posts

  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end
