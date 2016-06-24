class OrdersController < ApplicationController

def index 

	@orders = Order.all

end

def show 

	Rails.logger.debug " In showwwwwwwww methoddddddddddddddddddd: #{params.inspect}"
	@order = Order.find(params[:id])
	@cust_name = Customer.find(@order[:customer_id])[:name]
	@item_name = Item.find(@order[:item_id])[:name]

	respond_to do |format|
	  	format.json do 
	  		render json: @order.to_json
	  	end
	  	format.html do
	  	end
	end

end

def update

	Rails.logger.debug "In update methodddddddddddddd: #{params.inspect}"
	@order = Order.find(params[:id])
	Rails.logger.debug "In update methodddddddddddddd: #{@order.inspect}"
	respond_to do |format|
		if @order.update_attributes(params["order"])
	  		format.html {redirect_to order_path(@order), notice: "Item Details Updated"}
	  	else
	  		Rails.logger.debug "In erorrrrrrrrrrrrrrrr situtationnnnnnnnnnnnnn: #{@item.errors.inspect}"
	  		format.html {render action: :edit}
	  	end
	end

end

def destroy

	order_del = Order.find(params[:id])
	order_del.destroy
	redirect_to action: :index

end

def new

	@customers = Customer.all
	@items = Item.all

end

def create

	Rails.logger.debug "In createeeeeeeeeeeeeeeeeeeeeeeee methoddddddddddddd: #{params.inspect}"
	#@order = Order.new(:customer_id => params[:cust_id], :item_id => params[:item_add_id]) # This is another method of doing it, its' related part is also commented out in new.html.erb
	@order = Order.new(params[:order])
	respond_to do |format|
		if @order.save
	  		format.html {redirect_to orders_path(), notice: "New Order Created."}
	  	else
	  		Rails.logger.debug "In erorrrrrrrrrrrrrrrr situtationnnnnnnnnnnnnn: #{@order.errors.inspect}"
	  		format.html {render action: :new} #
	  	end
	end	

end


def edit

	Rails.logger.debug "In edit methoddddddddddddd: #{params.inspect}"
	@cust_list = Customer.all
	@item_list = Item.all
	@order = Order.find(params[:id])
	Rails.logger.debug "In edit methoddddddddddddd: #{@order.inspect}"
	respond_to do |format|
		format.json do 
			render json: @order.to_json
		end
		format.html do
		end
	end

end


end
