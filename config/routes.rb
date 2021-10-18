Rails.application.routes.draw do
  devise_for :customers

  get 'homes/about' => 'homes#about'
  root :to => "homes#top"

  resource :customers

  resources :items

#<!--管理者側ルーティング{Tsuyoshi}-->
  namespace :admin do
  resources :customers
  resource :items
end
#<!--管理者側ルーティング{Tsuyoshi}-->
end
