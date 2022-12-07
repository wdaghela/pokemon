class V1::PokemonsController < ApplicationController
    PAGE_SIZE = 100
    def index
			@page = params.fetch(:page, 0).to_i
			@pageSize = params.fetch(:size, PAGE_SIZE).to_i
			@pokemons = Pokemon.offset(@page * @pageSize).limit(@pageSize)

			render json: @pokemons, status: :ok
    end

		def show
			@pokemon = Pokemon.find(:first,:conditions=>"id='#{params[:id]}'")
			render json: @pokemon, status: :ok
		rescue
				head(:not_found)
		end

    def create
			@pokemon = Pokemon.create(create_params)

			if(!@pokemon.valid?)
				head(:bad_request)
			else
				@pokemon.save()
			render json: @pokemon, status: :created
			end
    end

    def destroy
			@pokemon = Pokemon.find(params[:id])
			@pokemon.destroy
			head(:ok)
		rescue
			head(:unprocessable_entity)
    end

		def update
			@pokemon = Pokemon.find(params[:id])
			@pokemon.update(update_params)
			render json: @pokemon, status: :ok
		rescue
			head(:unprocessable_entity)
		end

    private
    def create_params
			# implemented a few parameters for demonstration only
			params.require(:pokemon).permit(:name, :type1, :type2, :hp,:total, :legendary)
    end

		private
		def update_params
			# Few parameters used for demonstration only
			params.require(:pokemon).permit(:name,:type1,:type2)
		end
end
