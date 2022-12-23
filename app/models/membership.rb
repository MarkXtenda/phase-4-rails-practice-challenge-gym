class Membership < ApplicationRecord
    validate :one_gym_per_client
    belongs_to :gym
    belongs_to :client

    def one_gym_per_client
        gym_clients = Gym.find(gym_id).clients
        if gym_clients.any? { |client| client.id == client_id }
            errors.add(:client_id, "client cant attend in the same gym twice")
        end 
    end
end
