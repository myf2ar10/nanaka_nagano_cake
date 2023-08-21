class Admin::OrdersController < ApplicationController

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
      @order_details = OrderDetail.all
      flash[:notice] = "注文ステータスの更新に失敗しました。"
      render show
    end
  end

    def order_params
      params.require(:order).permit(:status)
    end

end
