Japanese::Application.routes.draw do
  resources :kanjis
  resources :static_pages

	root to: 'static_pages#home'
	match "/:kanji", to: "kanjis#show", as: :kanji_character

  #match '/library', to: 'users#show'
  #match '/:id',       to: 'stories#show'
  #match '/:id/edit',  to: 'stories#edit'
  #match '/:username' => 'users#show'
end
