Japanese::Application.routes.draw do
  resources :static_pages

 root to: 'static_pages#home'
end
