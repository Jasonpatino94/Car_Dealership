class SessionsController < ApplicationController
    def login
        if logged_in?
            redirect_to customer_path(current_customer)
        else
            @cusomter = Customer.new
        end
    end

    def logged_in
        @customer = Customer.find_by(email: params[:email])
        if @customer && @customer.authenticate(params[:password])
          session[:customer_id] = @customer.id
          redirect_to customer_path(@customer)
        else
            flash[:message] = "Email or Password is wrong"
            redirect_to login_path
        end
        
    end

    def logout
        session.clear
        redirect_to login_path
    end

    def google_login
        customer_email = request.env['omniauth.auth']['info']['email']
        customer_name = request.env['omniauth.auth']['info']['name']
        @customer = Customer.find_or_create_by(email: customer_email) do |customer|
            customer.name = customer_name
            customer.password = SecureRandom.hex
        end
        session[:customer_id] = @customer.id
        redirect_to customer_path(@customer)
    end
end