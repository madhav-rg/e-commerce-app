class OrdersController < ApplicationController

def index 

	@orders = current_user.orders
	Rails.logger.debug " In index methodddd: #{params.inspect}"

end

def show 

	Rails.logger.debug " In showwwwwwwww methoddddddddddddddddddd: #{params.inspect}"
	@order = Order.find(params[:id])
	Rails.logger.debug " In ssssssssssssssssssssssssssshow method: #{@order.inspect}"
	@cust_name = User.find(@order[:user_id])[:mid_name] 
	@item_name = Item.find(@order[:item_id])[:name] # Try to implement this in the index also


	respond_to do |format|
	  	format.json do 
	  		render json: @order.to_json
	  	end
	  	format.html do
	  	end
	end

end

def destroy

	order_del = Order.find(params[:id])
	order_del.destroy
	redirect_to action: :index

end

def new

	Rails.logger.debug "In new mmmmmmmmmmethodddddddddddddddddd: #{params["1"].inspect}"
	@customers = Customer.all
	@items = Item.all
	@items.each do |k|
		result = current_user.orders.find_by_item_id(k.id)
		if result
			Rails.logger.debug "In new methoddddd inssssssssssssside result condition: #{params["1"].inspect}"
			result.quantity = result.quantity + params[k.id.to_s].to_i
			result.save
		elsif params[k.id.to_s].to_i > 0 
			Rails.logger.debug "In new elseeeeeeeeeee methodddddddddddddddddd: #{params["1"].inspect}"
			new_item(params[k.id.to_s],k)
		end
	end
	redirect_to orders_path()

end

def new_item(quantity, item_obj)
	#Rails.logger.debug "In createeeeeeeeeeeeeeeeeeeeeeeee methodddddddddddd: #{item_obj.inspect}"
	Rails.logger.debug "In cccccccccccccccccccccccccccreate method: #{quantity.inspect}"
	new_obj = Order.create(:item_id => item_obj.id, :quantity => quantity, :user_id => current_user.id )
	new_obj.save
	Rails.logger.debug "In creaaaaaaaaaaaaaaaaaate methoddddddddddddd: #{new_obj.inspect}"

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
	#@cust_list = Customer.all
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


def update_quantity

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
end
