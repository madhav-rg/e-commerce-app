class CustomersController < ApplicationController

def index 

	@customer = Customer.all

end

def show 

	@customer = Customer.find(params[:id])

	respond_to do |format|
	  	format.json do 
	  		render json: @customer.to_json
	  	end
	  	format.html do
	  	end
	end

end

def update
	Rails.logger.debug "In update methodddddddddddddd: #{params.inspect}"
	@customer = Customer.find(params[:id])
	respond_to do |format|
		if @customer.update_attributes(params["customer"])
	  		format.html {redirect_to customer_path(@customer), notice: "Customer Updated"}
	  	else
	  		Rails.logger.debug "In erorrrrrrrrrrrrrrrr situtationnnnnnnnnnnnnn: #{@customer.errors.inspect}"
	  		format.html {render action: :edit}
	  	end
	end
end

def destroy

	Rails.logger.debug "In delete methodddddddddd: #{params.inspect}"
	cust = Customer.find(params[:id])
	cust.destroy
	redirect_to action: :index

end

def edit 
	
	@customer = Customer.find(params[:id])
	respond_to do |format|
	  	format.json do 
	  		render json: @customer.to_json
	  	end
	  	format.html do
	  	end
	  end
end


def create

	Rails.logger.debug "In create methoddddddddddddddddddddddddddd: #{params.inspect}"
	@customer = Customer.new(params[:customer])
=begin	
	if @customer.save
  		redirect_to action: :index
  	else
  		redirect_to action: :new
  	end
=end 	

	respond_to do |format|
		if @customer.save
	  		format.html {redirect_to customers_path(), notice: "New Customer entry created"}
	  	else
	  		Rails.logger.debug "In erorrrrrrrrrrrrrrrr situtationnnnnnnnnnnnnn: #{@customer.errors.inspect}"
	  		format.html {render action: :new} #
	  	end
	end

end

def new
	
	@customer = Customer.new()	
	respond_to do |format|
	  	format.json do 
	  		render json: @customer.to_json
	  	end
	  	format.html do
	  	end
	  end

end

def cust_order
	
	Rails.logger.debug "In customer_order methoddddddddddddd: #{params.inspect}"
	cust = User.find(params[:id])
	@orders = current_user.orders
	Rails.logger.debug "In cust_orderrrrrrrrrrrrrr methoddddd: #{cust.inspect}"
	redirect_to orders_path(@orders)
end




end
