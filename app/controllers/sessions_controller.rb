class SessionsController < ApplicationController
    def login
        @cusomter = Customer.new
    end

    def logged_in
        @customer = Customer.find_by(email: params[:email])
        if @customer && @customer.authenticate(params[:password])
          session[:customer_id] = @customer.id
          redirect_to customer_path(@customer)
        else
            render :login
        end
        
    end

    def logout
        session.clear
        redirect_to login_path
    end
    
end
