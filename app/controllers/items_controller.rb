class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item=Item.find(params[:id])
  end


private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :prefecture_id, :item_scheduled_delivery_id, :sell_price, :image).merge(user_id: current_user.id)
  end
end
