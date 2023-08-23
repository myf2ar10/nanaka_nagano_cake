class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def update
    order = Order.find(params[:id])
    order.status = params[:order][:status]

    if order.update(order_params)
      if order.status == "confirm"
        order_details = OrderDetail.where(order_id: order.id)
        order_details.each do |order_detail|
          order_detail.update(making_status: "waiting_for_making")
        end
      elsif order.status == "waiting"
        order_details = OrderDetail.where(order_id: order.id)
        order_details.each do |order_detail|
          order_detail.update(making_status: "not_available")
        end
      end
      flash[:notice] = "注文ステータスを更新しました"
      redirect_back(fallback_location: root_path)
    else
      @order = Order.find(params[:id])
      @order_details = OrderDetail.where(order_id: order.id)
      flash[:notice] = "注文ステータスの更新に失敗しました"
      render :show
    end

    # if order.update(order_params)
    #   flash[:notice] = "注文ステータスの更新に成功しました。"
    #   redirect_to admin_order_path(order.id)
    # else
    #   @order = Order.find(params[:id])
    #   @order_details = OrderDetail.where(order_id: @order.id)
    #   flash[:notice] = "注文ステータスの更新に失敗しました。"
    #   render "orders/show"
    # end
  end

  def individual
    @member = Member.find(params[:id])
    @orders = @member.orders.order(created_at: :desc).page(params[:page])
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
