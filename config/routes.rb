Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/_', to: 'shortlink#manage', as: 'manage'
  post '/_create', to: 'shortlink#create', as: 'create'

  get '/:name', to: 'shortlink#redirect', as: 'redirect'
  delete '/:name', to: 'shortlink#delete', as: 'delete'
end
