class VehiclesController < ApplicationController
    def index
        @vehicles = Vehicle.all.includes(:user).order(created_at: :desc)
    end

    def show
        @vehicle = Vehicle.find(params[:id])
        @chat = Chat.new
        @chats = @vehicle.chats.includes(:user).order(created_at: :asc)
        @request = Request.find_by(user_id: current_user.id)
        @matchings = Matching.all
    end

    def new
        @vehicle = Vehicle.new
    end

    def create
        @vehicle = current_user.vehicles.new(vehicle_params)
        if @vehicle.save
            redirect_to vehicles_path
        else
            render :new
        end
    end

    def edit
        @vehicle = current_user.vehicles.find(params[:id])
    end

    def update
        @vehicle = current_user.vehicles.find(params[:id])

        if @vehicle.update(vehicle_params)
            redirect_to vehicles_path
        else
            render :edit
        end
    end

    def destroy
        @vehicle = current_user.vehicles.find(params[:id])
        @vehicle.destroy
        redirect_to vehicles_path
    end

    def likes
        @likes_vehicles = current_user.like_vehicles.includes(:user).order(created_at: :desc)
    end

    private
    def vehicle_params
        params.require(:vehicle).permit(:vehicle_name, :description, :vehicle_image)
    end

end
