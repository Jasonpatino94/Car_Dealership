class DealershipsController < ApplicationController
    before_action :find_dealership, except: [:index, :new]

    def index
        @dealerships = Dealership.all
    end

    def new
        @dealership = Dealership.new
    end
    
    def create
        @dealership = Dealership.create(dealership_params)
        if @dealership.save
            redirect_to dealership_path
        else 
            render :new
        end
    end

    def update
        @dealership.update(dealership_params)
        
    end

    def destroy
        @dealership.destroy
    end

    private

    def dealership_params
        params.require(:dealership).permit(:name, :kind, :rating)
    end
    
    def find_dealership
        @dealership = Dealership.find_by(id: params[:id])
     end
    
end
