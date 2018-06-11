Rails.application.routes.draw do
  root to: 'jobs#premium'

  #cria uma rota dentro das rotas jobs (rota aninhada)
  resources :jobs do
    post 'comments', to: 'comments#create'
  end
  get 'hello/world'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
