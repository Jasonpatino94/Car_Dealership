class VehiclesController < ApplicationController
    before_action :find_vehicle, except: [:index, :new]

    def index
        if params[:dealership_id]
            @dealership = Dealership.find_by(id: params[:dealership_id])
            @vehicles = @dealership.vehicles.with_no_customer
        elsif params[:customer_id]
            @customer = Customer.find_by(id: params[:customer_id])
            @vehicles = @customer.vehicles
        else 
            @vehicles = Vehicle.with_no_customer
        end
    end
    
    def new
        @vehicle = Vehicle.new
        @dealership = Dealership.find_by(id: params[:dealership_id])
    end

    def show 
    end
    
    def create
        @vehicle = Vehicle.create(vehicle_params)
        @dealership = Dealership.find_by(id: params[:dealership_id])
        @vehicle.dealership = Dealership.find_by(id: params[:dealership_id])
        if @vehicle.save
            redirect_to vehicle_path(@vehicle)
        else
            render :new
        end
    end
    
    def purchase
        customer = current_customer
        @vehicle = Vehicle.find_by(id: params[:vehicle_id])
        customer.vehicles << @vehicle
        redirect_to customer_vehicles_path(customer.id)
    end

    def edit
        if @vehicle.customer && @vehicle.customer == current_customer
            render :edit
        else 
            redirect_to vehicle_path(@vehicle)   
        end  
    end

    def update 
        if @vehicle.update(vehicle_params)
            redirect_to vehicle_path(@vehicle)
        else
            render :edit
        end
    end

    def destroy
        @vehicle.destroy
        redirect_to customer_path(current_customer)
    end

    private

    def vehicle_params
        params.require(:vehicle).permit(:year, :make, :model, :kind, :customer_id, :dealership_id)
    end

    def find_vehicle
        @vehicle = Vehicle.find_by(id: params[:id])
    end
end
