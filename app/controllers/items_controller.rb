class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :contributor_confirmation, only: [:edit, :update]
  
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

  def edit
    @item=Item.find(params[:id])
  end
  
  def update
    if @item.update(item_params)
       redirect_to @item
    else
      render :edit, status: :unprocessable_entity
  end
  end

private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :prefecture_id, :item_scheduled_delivery_id, :sell_price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item=Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end
end
