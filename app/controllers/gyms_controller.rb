class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index 
        gyms = Gym.all
        render json: gyms
    end

    def show
        gym = Gym.find(params[:id])
        render json: gym
    end

    def update 
        gym = Gym.find(params[:id])
        if gym 
            gym.update!(permited_params)
            render json: gym
        end
    end

    def destroy
        gym = Gym.find(params[:id])
        if gym
            gym.destroy!
            head :no_content
        end
    end

    private 

    def permited_params
        params.permit(:name, :address)
    end

    def record_not_found
        render json: { "error": "Gym not found"}, status: 404
    end
end
