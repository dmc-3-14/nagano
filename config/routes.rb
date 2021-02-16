Rails.application.routes.draw do

  scope module: :customer do
    get 'shippings/edit'
    get 'shippings/index'
  end
  scope module: :customer do
    get 'cart_items/index'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  scope module: :customer do
    get 'items/show'
    get 'items/index'
  end
  namespace :admin do
    get 'items/index'
    get 'items/show'
    get 'items/new'
    get 'items/edit'
  end
  scope module: :customer do
    get 'orders/show'
    get 'orders/index'
    get 'orders/put'
    get 'orders/confirm'
    get 'orders/complete'
  end
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
  end
  scope module: :customer do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/exit'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
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

  namespace :admin do
    root to: 'homes#top'
  end
  scope module: :customer do
    root to: 'homes#top'
  end

end
