class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(is_active: true).page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end
end
