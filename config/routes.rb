Rails.application.routes.draw do
  root to: 'jobs#premium'

  #cria uma rota dentro das rotas jobs (rota aninhada)
  resources :jobs do
    post 'comments', to: 'comments#create'
  end

  get  "/companies/login", to: "login#new"
  post "/companies/login", to: "login#create"
  delete "/companies/login", to: "login#destroy"

  resources :companies, only: [:new, :create]
  delete 'comments/:id', to: 'comments#destroy', as: :comment
  get 'hello/world'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
