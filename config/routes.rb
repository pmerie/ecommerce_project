Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # 🔥 ADD THIS BELOW ActiveAdmin.routes(self)
  namespace :admin do
    resources :books do
      member do
        get :delete_book
      end
    end
  end
end
