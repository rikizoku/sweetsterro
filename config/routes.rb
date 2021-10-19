Rails.application.routes.draw do

  devise_for :admins
  namespace :admin do
    resources :items
    resources :customers
  end
<<<<<<< HEAD
  
  devise_for :customers, skip: :all
  devise_scope :customers do
    get 'customers/login' =>  'devise/sessions#new', as: :new_customer_session
  end
  
  get 'customers/withdraw_confirm' => 'customers#withdraw_confirm' 
=======


  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "customers/registrations",
  sessions: 'customers/sessions'
}

>>>>>>> origin/develop


  get 'homes/about' => 'homes#about'
  root :to => "homes#top"

# 会員側ルート
  scope module: 'customers' do
    resource :customers
    resources :items
    resource :order
     get 'order/confirm' => 'orders#confirm'
  end

end
