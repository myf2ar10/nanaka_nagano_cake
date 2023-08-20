class Public::CartItemsController < ApplicationController
  before_action :authenticate_member!

  def index
    @cart_items = current_member.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def create
    @cart_item = current_member.cart_items.find_or_initialize_by(item_id: params[:cart_item][:item_id])

    if current_member.cart_items.find_by(item_id: @cart_item.item_id).present?
      @cart_item.count += params[:cart_item][:count].to_i
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.member_id = current_customer.id
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
    params.require(:cart_item).permit(:member_id, :item_id, :count)
  end

end
