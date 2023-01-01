class LikesController < ApplicationController
    def create
        vehicle = Vehicle.find(params[:vehicle_id])
        current_user.like(vehicle)
        redirect_to vehicles_path
    end

    def destroy
        @like = Like.find_by(user_id: current_user.id, vehicle_id: params[:vehicle_id])
        @like.destroy
        redirect_to vehicles_path
    end
end
