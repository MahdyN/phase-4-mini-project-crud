class SpicesController < ApplicationController
    wrap_parameters format: []
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    #GET "/spices"
    def index
        render json: Spice.all, status: :ok
    end

    #GET "/spices/:id"
    # def show
    #     spice = find_spice
    #     render json: spice, status: :ok
    # end

    #POST "/spices"
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    #PATCH "/spices/:id"
    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice, status: :accepted
    end

    #DELETE "/spices/:id"
    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    end



    private

    def render_not_found_response
        render json: {error: "Spice not Found"}, status: :not_found
    end

    def find_spice
        Spice.find(params[:id])
    end

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

end
