Rails.application.routes.draw do

  namespace :admin do
    resources :tweets, only: [:index,:show,:destroy] do
      resources :comments, only: [:destroy]
    end
    resources :customers, only: [:index,:show,:destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

scope module: 'public' do
    root to: 'homes#top'
    resources :tweets, only: [:new,:create,:index,:show,:update,:destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    resources :customers, only: [:show, :edit, :update]
    resources :babyfoods, only: [:new,:create,:index,:show,:update,:destroy,:create]
  end


end
