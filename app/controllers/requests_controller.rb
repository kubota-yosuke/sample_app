class RequestsController < ApplicationController

    def create
        current_user.requests.create(vehicle_id: request_params[:vehicle_id])
        redirect_to vehicle_path(request_params[:vehicle_id])
    end
    
    def destroy
        @request = Request.find(params[:id])
        @request.destroy!
        @vehicle = Vehicle.find(params[:vehicle_id])
        redirect_to vehicle_url(@vehicle)
    end

    def index
        @requests = Request.where(vehicle_id: params[:vehicle_id])
    end


    private
    def request_params
        params.permit(:vehicle_id)
    end
    
end
