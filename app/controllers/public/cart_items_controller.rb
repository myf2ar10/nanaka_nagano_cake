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
  
    if @existing_cart_item.present?
      total_quantity = @existing_cart_item.quantity + @cart_item.quantity
  
      if total_quantity <= 10
        @existing_cart_item.quantity = total_quantity
  
        if @existing_cart_item.save
          redirect_to cart_items_path, notice: "商品を追加しました。"
        else
          flash.now[:notice] = "商品の追加に失敗しました"
          render_items_show
        end
      else
        flash.now[:notice] = "カート内の同一商品が10個を超えています。カート内をご確認ください。"
        render_items_show
      end
    else
      if @cart_item.save
        redirect_to cart_items_path, notice: "商品を追加しました。"
      else
        flash.now[:notice] = "商品の追加に失敗しました"
        render_items_show
      end
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path, notice: "数量を変更しました。"
    else
      flash.now[:notice] = "数量を変更できませんでした。"
      @cart_items = CartItem.where(member:current_member)
      @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
      render :index
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    if @cart_item.destroy
      redirect_to cart_items_path, notice: "商品を削除しました。"
    else
      flash.now[:notice] = "商品の削除に失敗しました。"
      render :cart_items_path
    end
  end

  def destroy_all
    if current_member.cart_items.destroy_all
      redirect_to cart_items_path, notice: "カートを空にしました。"
    else
      flash.now[:notice] = "削除に失敗しました。"
      render :cart_items_path
    end
  end

  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end

  def render_items_show
    @item = Item.find(params[:cart_item][:item_id])
    @cart_item = CartItem.new
    @genres = Genre.all
    render "public/items/show"
  end
end
