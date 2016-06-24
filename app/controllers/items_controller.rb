class ItemsController < ApplicationController


def index 

	@items = Item.all
	Rails.logger.debug " In indddddddddexxxxxxxxxxxxxxxxx methoddddddddd: #{@items.inspect}"

end

def show 

	@items = Item.find(params[:id])

	respond_to do |format|
	  	format.json do 
	  		render json: @items.to_json
	  	end
	  	format.html do
	  	end
	end

end

def edit
	@item = Item.find(params[:id])
	respond_to do |format|
	  	format.json do 
	  		render json: @item.to_json
	  	end
	  	format.html do
	  	end
	  end
end


def update
	
	Rails.logger.debug "In update methodddddddddddddd: #{params.inspect}"
	@item = Item.find(params[:id])
	respond_to do |format|
		if @item.update_attributes(params["item"])
	  		format.html {redirect_to item_path(@item), notice: "Item Details Updated"}
	  	else
	  		Rails.logger.debug "In erorrrrrrrrrrrrrrrr situtationnnnnnnnnnnnnn: #{@item.errors.inspect}"
	  		format.html {render action: :edit}
	  	end
	end

end

def destroy

	item_del = Item.find(params[:id])
	item_del.destroy
	redirect_to action: :index

end

def new
	@item = Item.new()	
	respond_to do |format|
	  	format.json do 
	  		render json: @item.to_json
	  	end
	  	format.html do
	  	end
	  end
	
end

def create
	Rails.logger.debug "In create methoddddddddddddddddddddddddddd: #{params.inspect}"
	@item = Item.new(params[:item])
	respond_to do |format|
		if @item.save
	  		format.html {redirect_to items_path(), notice: "New Item Created."}
	  	else
	  		Rails.logger.debug "In erorrrrrrrrrrrrrrrr situtationnnnnnnnnnnnnn: #{@item.errors.inspect}"
	  		format.html {render action: :new} #
	  	end
	end	

end



end
