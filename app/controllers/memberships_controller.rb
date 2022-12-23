class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    def create 
        membership = Membership.create!(permited_params)
    end

    private 

    def permited_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def record_invalid(invalid)
        render json: { "errors": invalid.record.errors }
    end
end
