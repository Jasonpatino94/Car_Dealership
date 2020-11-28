class VehiclesController < ApplicationController
    before_action :find_movie, except: [:index, :new]

    def index
        @vehicle = Vehicle.all
    end
    
    def new
        @vehicle = Vehicle.new
    end
    
    def create
        @vehicle = Vehicle.create(vehicle_params)
        if vehicle.save
            redirect_to vehicle_path
        else
            render :new
        end
    end

    def update 
        @vehicle.update(vehicle_params)
        if @vehicle.update
            redirect_to vehicle_path
        else
            render :edit
        end
    end

    def destroy
        @vehicle.destroy
    end

    private

    def vehicle_params
        params.require(:vehicle).permit(:year, :make, :model, :kind, :customer_id, :dealership_id)
    end

    def find_vehicle
        @vehicle = Vehicle.find_by(id: params[:id])
    end
end
