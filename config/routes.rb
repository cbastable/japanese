Japanese::Application.routes.draw do
  #resources :kanjis
  resources :static_pages
  resources :collections do
    member do
      get :random
    end
    resources :kanjis
  end


	root to: 'static_pages#home'
	match "/:kanji", to: "kanjis#show", as: :kanji_character
  match "/collections/:collection/:kanji", to: "kanjis#show", as: :kanji_in_set
	match "/collections/:collection", to: "collections#show", as: :collection_set

  #match '/library', to: 'users#show'
  #match '/:id',       to: 'stories#show'
  #match '/:id/edit',  to: 'stories#edit'
  #match '/:username' => 'users#show'
end
