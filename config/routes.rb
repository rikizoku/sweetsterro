Rails.application.routes.draw do

  devise_for :admins
    namespace :admin do
    resources :items
    resources :customers
  end

  devise_for :customers, skip: :all
  devise_scope :customers do
    get 'customers/sign_in' => 'devise/sessions#new', as: :new_customer_session
    post 'customers/sign_in' => 'devise/sessions#create', as: :customer_session
    delete 'customers/sign_out' => 'devise/sessions#destroy', as: :destroy_customer_session
    get 'customers/sign_up' => 'devise/registrations#new', as: :new_customer_registration
    post 'customers' => 'devise/registrations#create', as: :customer_registration

  end


  get 'homes/about' => 'homes#about'
  root :to => "homes#top"

  resource :customers

end
