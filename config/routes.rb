Rails.application.routes.draw do
  # games routes
  root to: 'games#index'
  get 'games/:id', to: 'games#view'

  # scenarios routes
  get 'games/:id/scenarios', to: 'scenarios#index'
  get 'games/:id/scenarios/:id', to: 'scenarios#view'

  # battles routes
  get 'games/:id/scenarios/:id/battles', to: 'battles#index'
  get 'games/:id/scenarios/:id/battles/:id', to: 'battles#view'
end
