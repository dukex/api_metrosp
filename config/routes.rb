ApiMetro::Application.routes.draw do
  get "pages/index"

  UtopiaData.routes(self)
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'pages#index'

end
