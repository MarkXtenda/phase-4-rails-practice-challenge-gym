class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index 
        clients = Client.all
        render json: clients
    end

    def show
        client = Client.find(params[:id])
        render json: client
    end

    def update 
        client = Client.find(params[:id])
        if client 
            client.update!(permited_params)
            render json: client
        end
    end

    private 

    def permited_params
        params.permit(:name, :age)
    end

    def record_not_found
        render json: { "error": "Client not found"}, status: 404
    end
end
