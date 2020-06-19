class PokemonsController < ApplicationController
  skip_before_action :verify_authenticity_token
  # def show
  #   fill_default(params)
  #   # render :json => {name: params[:name], type: params[:type], type2: params[:type2], level: params[:level]}
  #   @pokemon = params
  #   render 'pokemons/show'
  # end

  # private
  #   def poke_type
  #     pokemon_type = [{fire: "red"}, {water: "blue"}, {grass: "green"}, {electric: "yellow"}]
  #     pokemon_type.sample
  #   end

  #   def poke_level
  #     pokemon_levels = [*1..100]
  #     pokemon_levels.sample
  #   end

  #   def poke_name
  #     pokemon_names = ["Pikachu","Bulbasaur","Charmander","Squirtle"]
  #     pokemon_names.sample
  #   end

  #   def fill_default(params)
  #     params[:name] = poke_name if !params.has_key?(:name)
  #     params[:type] = poke_type if !params.has_key?(:type)
  #     params[:level] = poke_level if !params.has_key?(:level)
  #     params[:type2] = poke_type
  #   end



  def index
    @pokemons = all_pokemons
  end

  def show
    params[:description] = poke_desc(params[:name])
    params[:img] = "https://pokeres.bastionbot.org/images/pokemon/#{params[:order]}.png"
    params[:types] = poke_types(params[:name])
    # params[:type_colour] = poke_type_colour(params[:types])
    @pokemon = params
  end



  private
  def all_pokemons
    pokemons = Array.new
    response = HTTParty.get('https://pokeapi.co/api/v2/pokemon?limit=151')
    data = response['results']
    data.each.with_index do |pokemon, i|
      poke_order = i + 1
      poke_img = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/#{poke_order}.png"
      poke_name = pokemon['name'].upcase

      
      poke_hash = {:name => poke_name, :order => poke_order, :img => poke_img}
      pokemons.push(poke_hash)
    end
    pokemons
  end

  def poke_desc(poke_name)
    response = HTTParty.get("https://pokeapi.co/api/v2/pokemon-species/#{poke_name.downcase}")
    #grabs pokemon description from response
    response["flavor_text_entries"][0]["flavor_text"]
  end
  
  def poke_types(poke_name)
    poke_types = Array.new
    response = HTTParty.get("https://pokeapi.co/api/v2/pokemon/#{poke_name.downcase}")

    #grabs every type of the pokemon and returns the array
    response['types'].each do |type|
      poke_types.push(type['type']['name'])
    end
    poke_types
  end

  # def poke_type_colour(types_arr)
  #   colours_to_type = {
  #     'fire' => 'red'
  #   }
  #   types_arr.each do |type|
  #     if colours_to_type.has_key?(type)

  #     end
  #   end
  # end

end