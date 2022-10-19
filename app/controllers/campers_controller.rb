class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid 

    def index 
        render json: Camper.all, staus: :ok
    end

    def show 
     camper= Camper.find(params[:id])
     render json: camper, serializer: CamperActivitySerializer, status: :ok
    end

    def create 
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

     private 
    
     def invalid
        render json: {error: "Validation error"}, status: :unprocessable_entity
     end 

     def not_found
        render json: {error: "Camper Not found"}, status: :not_found
     end

    def camper_params 
        params.permit(:name, :age)
    end
end
