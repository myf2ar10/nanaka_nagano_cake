class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end
  def update
    order = Order.find(params[:id])
    if order.update(order_params)
      flash[:notice] = "注文ステータスの更新に成功しました。"
      redirect_to admin_order_path(order.id)
    else
      @order = Order.find(params[:id])
      @order_details = OrderDetail.where(order_id: @order.id)
      flash[:notice] = "注文ステータスの更新に失敗しました。"
      render "orders/show"
    end
  end
  
  def individual
    @member = Member.find(params[:id])
    @orders = @member.orders.page(params[:page])
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
