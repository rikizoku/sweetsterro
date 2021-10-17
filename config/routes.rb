Rails.application.routes.draw do
  devise_for :customers

  get 'homes/about' => 'homes#about'
  root :to => "homes#top"

end
