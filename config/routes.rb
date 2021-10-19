Rails.application.routes.draw do

  devise_for :admins
    namespace :admin do
    resources :items
    resources :customers
  end

  devise_for :customers, skip: :all
  devise_scope :customers do
  get 'customers/login' =>  'devise/sessions#new', as: :new_customer_session
  end


  get 'homes/about' => 'homes#about'
  root :to => "homes#top"

  resource :customers

end
