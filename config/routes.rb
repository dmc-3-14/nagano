Rails.application.routes.draw do

  namespace :admin do
    resources :customers, only: [ :index, :show, :edit, :update]
  end

  scope module: :customer do
    resource :customers, only: [ :show, :edit, :update] do
      member do
        patch 'stateupdate'
        get 'exit'
        put "/customers/:id/hide" => "customers#hide", as: 'customers_hide'
      end
    end
  end

  namespace :admin do
    resources :genres, only: [:create, :index, :edit, :update]
  end

  scope module: :customer do
    resources :items, only: [:show, :index]
  end

  namespace :admin do
    resources :items, only: [ :index, :show, :new, :create, :edit, :update]
  end

  scope module: :customer do
      resource :orders, except: [:show] do
        get 'put'
        post 'confirm'
        get 'complete'
    end
    resources :orders, only: [ :index, :show, :create]
  end

  namespace :admin do
    resources :orders, only: [ :index, :show, :update]
  end

  namespace :admin do
    resources :orderd_items, only: [:update]
  end

  scope module: :customer do
    resources :cart_items, only: [:index, :create, :destroy, :update] do
      member do
        delete 'alldestroy'
      end
    end
  end

  scope module: :customer do
    resources :shippings, only: [:create, :destroy, :edit, :update, :index]
  end

  namespace :admin do
    root to: 'homes#top'
  end

  scope module: :customer do
    root to: 'homes#top'
    get 'home/about' => 'homes#about'
  end

      devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }



end
