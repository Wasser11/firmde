Rails.application.routes.draw do


  get 'static_pages/contact_us'

  resources :site_settings

  resources :slideshows do
    resources :elements do
      get 'remove_photo', on: :member
    end
  end

  resources :kundens

  devise_scope :user do
    get "/users" => "users/registrations#index"
    get "/user/:id/change_role" => "users/registrations#change_role", as: "user_change_role"
  end
  devise_for :users

  resources :blocks
  resources :pages do
    resources :page_backups, only: [:show, :index, :destroy] do 
      get 'replace', on: :member
    end
  end

  resources :blogs do
    get 'admin', on: :collection
  end
  
  get "admin", to:'backends#dashboard', as: "admin"
  get "admin/loesungen", to:'backends#loesungen', as: "admin_loesungen"
  get "admin/services", to:'backends#services', as: "admin_services"
  

  get 'home/index'

  root 'home#index'
end