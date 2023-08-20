class Public::CartItemsController < ApplicationController
  before_action :authenticate_member!

  def index
    @cart_items = CartItem.where(member:current_member)
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.member_id = current_member.id
    
    @existing_cart_item = CartItem.find_by(item: @cart_item.item)
    if @existing_cart_item.present? and @cart_item.valid?
      @cart_item.quantity += @existing_cart_item.quantity
      @existing_cart_item.destroy
    end

    if @cart_item.save
      redirect_to cart_items_path, notice: "商品を追加しました。"
    else
      redirect_to item_path(@cart_item.item), notice: "追加に失敗しました。"
    end
    
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path, notice: "数量を変更しました。"
    else
      redirect_to cart_items_path, notice: "数量を変更できませんでした。"
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    if @cart_item.destroy
      redirect_to cart_items_path, notice: "商品を削除しました。"
    else
      redirect_to cart_items_path, notice: "商品の削除に失敗しました。"
    end
  end

  def destroy_all
    if current_member.cart_items.destroy_all
      redirect_to cart_items_path, notice: "カートを空にしました。"
    else
      redirect_to cart_items_path, notice: "削除に失敗しました。"
    end
  end


  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end

end
