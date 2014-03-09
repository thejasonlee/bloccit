Bloccit::Application.routes.draw do
resources :posts

  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end
