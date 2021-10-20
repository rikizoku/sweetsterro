Rails.application.routes.draw do

  # 会員側ルート
  scope module: 'customers' do
    resource :customers, except: :create
    resources :items
    resource :order
    get 'order/confirm' => 'orders#confirm'
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

end
