Rails.application.routes.draw do
  devise_for :admins
    namespace :admin do
    resources :items
  end
  devise_for :customers

  get 'homes/about' => 'homes#about'
  root :to => "homes#top"

  resource :customers


end
