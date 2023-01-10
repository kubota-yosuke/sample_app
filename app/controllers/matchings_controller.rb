class MatchingsController < ApplicationController

    def index
        @matchings = Matching.all
    end

    def create
        @matching = Matching.create(vehicle_id: matching_params[:vehicle_id], user_id: matching_params[:user_id])
        Request.where(vehicle_id: matching_params[:vehicle_id]).delete_all
        redirect_to vehicle_requests_url(@matching.vehicle)
    end

    def destroy
        @matching = Matching.find(params[:id])
        @matching.destroy!
        redirect_to vehicles_path
    end

    private

    def matching_params
        params.permit(:vehicle_id, :user_id, :request_id)
    end
end
