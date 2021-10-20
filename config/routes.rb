Rails.application.routes.draw do

 devise_for :admins
    namespace :admin do
    resources :items
    resources :customers
  end

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "customers/registrations",
  sessions: 'customers/sessions'
  }
  get 'homes/about' => 'homes#about'
  root :to => "homes#top"

  resource :customers
  scope module: 'customers' do
    resource :customers
    resources :items
    resource :order
    resources :cart_items do
     collection do
     delete 'destroy_all', to: 'cart_items#destroy_all'
     end
    
     get 'order/confirm' => 'orders#confirm'
  end

  end
  
 end