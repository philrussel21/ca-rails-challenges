Rails.application.routes.draw do

  root 'hotels#home'
  get 'hotels/index', as: 'index'
  get 'hotels/home'
  get 'products/index', as: 'products'


  get 'celebrities/index', as: 'celeb_index'
  get 'celebrities/show', as: 'celeb_show'
  get 'celebrities/create'
  get 'celebrities/update'
  get 'celebrities/destroy'

  # post 'pokemons(/:name(/:type(/:level)))', to: 'pokemons#show'
  get 'pokemons/index', as: 'pokemons_index'
  get 'pokemons/show', as: 'pokemons_show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
