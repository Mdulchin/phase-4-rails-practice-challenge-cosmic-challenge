class ScientistsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :no_record

    def index 
        render json: Scientist.all
    end

    def show
        scientist = find_scientist
        render json: scientist
    end

    def create
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end

    def update
        scientist = find_scientist
        scientist.update!(scientist_params)
        render json: scientist, status: :accepted
    end

    def destroy
        scientist = find_scientist
        scientist.destroy
        head :no_content
    end

    private 

    def find_scientist
       Scientist.find(params[:id])
    end

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

    def no_record
        render json: {error: "Scientist not found"}, status: :not_found
    end
end
