Rails.application.routes.draw do

  # Management URL's come first; these are reserved URL's and should be ignored if a user manages
  # to create a shortlink containing '_'.
  get '/_', to: 'shortlink#manage', as: 'manage'
  post '/_create', to: 'shortlink#create', as: 'create'
  delete '/:name', to: 'shortlink#delete', as: 'delete'

  # Redirection URL's; core route case for normal users.
  get '/:name', to: 'shortlink#redirect', as: 'redirect', constraints: {
    name: /[a-zA-Z0-9]/,
  }

  # Home URL redirects to management page.
  get '/', to: redirect('/_')
end
