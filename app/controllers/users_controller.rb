class UsersController < ApplicationController


def index


end



def user_orders  #These functionality can also be done by orders->index method.

	Rails.logger.debug "In customer_order methoddddddddddddd: #{params.inspect}"
	#cust = User.find(params[:id])
	@orders = current_user.orders
	Rails.logger.debug "In customer_order methoddddddddddddd: #{@orders.inspect}"
	redirect_to orders_path(@orders)

end


end