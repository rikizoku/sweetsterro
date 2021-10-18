Rails.application.routes.draw do
  devise_for :customers, skip: :all
  devise_scope :customers do
    get 'customers/login' =>  'devise/sessions#new', as: :new_customer_session
    get
  end

  get 'homes/about' => 'homes#about'
  root :to => "homes#top"

  resource :customers
  namespace :admin do
    resources :items
  end

  resources :items

#<!--管理者側ルーティング{Tsuyoshi}-->
  namespace :admin do
  resources :customers
  resource :items
end
#<!--管理者側ルーティング{Tsuyoshi}-->
end
