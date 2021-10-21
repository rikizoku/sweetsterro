Rails.application.routes.draw do

  scope module: 'customers' do
    resource :customers, except: :create
    resources :items
    resources :orders do
      collection do
        post :confirm
      end
    end
    resources :cart_items do
    collection do
    delete 'destroy_all', to: 'cart_items#destroy_all'
    end
    end
    resources :addresses
    get '/customers/withdraw_confirm' => 'customers#withdraw_confirm'
    patch '/customers/withdraw' => 'customers#withdraw'

  end


   devise_for :admins
    namespace :admins do
    resources :items
    resources :customers
    resources :genres, only: [:index, :edit, :create, :update]
    get '/' => 'homes#top'
    
  end

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "customers/registrations",
    sessions: 'customers/sessions'
}

  get 'homes/about' => 'homes#about'
  root :to => "homes#top"

end
