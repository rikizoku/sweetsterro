Rails.application.routes.draw do

  # 会員側ルート
  scope module: 'customers' do
    resource :customers, except: :create
    resources :items
    resource :order
    resources :cart_items do

    collection do
    delete 'destroy_all', to: 'cart_items#destroy_all'
    end

    end
    get 'order/confirm' => 'orders#confirm'
    get '/customers/withdraw_confirm' => 'customers#withdraw_confirm'
    patch '/customers/withdraw' => 'customers#withdraw'

  end

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

  resources :photos do
  get 'preview', on: :member
  end

end
