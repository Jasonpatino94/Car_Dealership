module ApplicationHelper
    def current_customer
        @current_customer ||= Customer.find_by_id(session[:customer_id])
      end

      def logged_in?
        !!current_customer
      end

      def logged_out
          !logged_in?
      end

      def authorized_customer?(vehicle)
        vehicle.user == current_customer
      end
end
