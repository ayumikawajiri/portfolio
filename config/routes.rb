Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root 'root#index'

  resources :users, only: [:show]

  get '/state', to: 'cities#state_city', as: 'state'
  get 'classifieds/new', to: 'classifieds#new', as: 'new_classified'
  post 'classifieds', to: 'classifieds#create'
  resources :cities do
    get 'classifieds/categories', to: 'classifieds#category', as: 'classified_categories'
    resources :classifieds, except: [:new, :create] do
      get 'confirm', to: 'classifieds#confirm', as: 'confirm'
      resource :contacts, only: [:new, :create] do
        collection do
          post 'confirm'
        end
        member do
          put 'confirm'
          patch 'confirm'
        end
      end
      resources :comments do
        collection do
          post 'confirm'
        end
        member do
          put 'confirm'
          patch 'confirm'
        end
      end
    end
  end
  
  resources :notices do
    collection do
      post 'confirm'
    end
    member do
      put 'confirm'
      patch 'confirm'
    end
  end

  get 'information/categories', to: 'information#category', as: 'information_categories'
  resources :information do
    collection do
      post 'confirm'
    end
    member do
      put 'confirm'
      patch 'confirm'
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
