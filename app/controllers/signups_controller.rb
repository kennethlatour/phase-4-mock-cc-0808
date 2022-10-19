class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid 
 
    def create 
        signup = Signup.create!(sign_params)
        render json: signup, status: :created
    end 

    private 

        
    def invalid
        render json: {error: "Validation error"}, status: :unprocessable_entity
     end 

    def sign_params
        params.permit(:camper_id, :activity_id, :time)
    end
end
