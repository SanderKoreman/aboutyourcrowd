Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "uikit", to: "pages#uikit"
  get "test", to: "pages#test"
  get "/print", to: "printing#print"

  resources :users, only: [ :edit, :update ]

  resources :hashtags, only: [ :index, :show, :create, :destroy, :update]

  get '/my-dashboard', to: 'dashboards#my_dashboard', as: :my_dashboard

  # get '/pdf', to: 'dashboards#printpdf', as: :printpdf
end
