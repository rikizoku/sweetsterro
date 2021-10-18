Rails.application.routes.draw do
  
  devise_for :admins
    namespace :admin do
    resources :items
    resources :customers
  end
  devise_for :customers

  get 'homes/about' => 'homes#about'
  root :to => "homes#top"

 


end
