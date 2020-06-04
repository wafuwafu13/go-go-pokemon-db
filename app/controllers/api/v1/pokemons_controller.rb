module Api
  module V1
    class PokemonsController < ApplicationController
      before_action :set_pokemon, only: [:show, :destroy]

      def index
        pokemons = Pokemon.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded pokemons', data: pokemons }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the pokemon', data: @pokemon }
      end

      def create
        pokemon = Pokemon.new(pokemon_params)
        if pokemon.save
          render json: { status: 'SUCCESS', data: pokemon }
        else
          render json: { status: 'ERROR', data: pokemon.errors }
        end
      end

      def destroy
        @pokemon.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the pokemon', data: @pokemon }
      end

      private

      def set_pokemon
        @pokemon = Pokemon.find(params[:id])
      end

      def pokemon_params
        params.require(:pokemon).permit(:name, :poke_id)
      end
    end
  end
end