Japanese::Application.routes.draw do
  
  resources :kanjis
  #resources :words
  resources :static_pages
  resources :collections do
    member do
      get :random
    end
    resources :kanjis
  end


	root to: 'static_pages#home'
	#match "/:kanji", to: "kanjis#show", as: :kanji_character
  match "/comingsoon", to: "static_pages#comingsoon", as: :comingsoon
  match "/thanksto", to: "static_pages#thanksto", as: :thanksto
	match "/collections/:collection", to: "collections#show", as: :collection_set
  match "/collections/:collection/:kanji", to: "kanjis#show", as: :kanji_in_set
  match "/test/:collection/:kanji", to: "collections#test", as: :collection_test
  match "/words/:collection", to: "collections#words", as: :word_set
  match "/words/:collection/:word", to: "words#show", as: :word_in_set

  #match '/library', to: 'users#show'
  #match '/:id',       to: 'stories#show'
  #match '/:id/edit',  to: 'stories#edit'
  #match '/:username' => 'users#show'
end
