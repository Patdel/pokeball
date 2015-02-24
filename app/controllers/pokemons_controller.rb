class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :update, :destroy]

  def index
    @pokemons = Pokemon.all
  end

  def show
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      render :show, status: :created, location: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  def update
    if @pokemon.update(pokemon_params)
      render :show, status: :ok, location: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @pokemon.destroy
    head :no_content
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :image_url, :pkdx_id, :catch_ratio, :attack, :defense, :health, :speed, :weight, :height)
  end
end