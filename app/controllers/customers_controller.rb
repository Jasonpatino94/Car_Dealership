class CustomersController < ApplicationController
    before_action :find_customer, except: [:index, :new,]

    def new
        @customer = Customer.new
    end

    def create 
        @customer = Customer.create(customer_params)
        if @customer.save
            session[:customer_id] = @customer.id
            redirect_to customer_path
        else
            render :new
        end
    end

    
    private
    
    def customer_params
        params.require(:customer).permit(:name, :password, :email)
    end

    def find_customer
        @customer = Customer.find_by(id: params[:id])
     end
    
    
end
