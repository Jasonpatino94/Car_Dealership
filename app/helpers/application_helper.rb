module ApplicationHelper
    def current_customer
        @current_customer ||= Customer.find_by_id(session[:customer_id])
      end

      def logged_in?
        !!current_customer
      end

      def if_logged_out
        if !logged_in?
          redirect "/users/signin"
        end
      end

      def authorized_custeomer?(vehicle)
        vehicle.user == current_customer
      end
end
