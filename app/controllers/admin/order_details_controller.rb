class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!, only: [:update]

  def update

    @order_detail = OrderDetail.find(params[:id])

    if @order_detail.update(order_detail_params)
      @order = @order_detail.order
      if @order.order_details.any? { |order_detail| order_detail.making_status == "making" }
        @order.update(status: "making")
      elsif @order.order_details.all? { |order_detail| order_detail.making_status == "made" }
        @order.update(status: "preparing")
      end

      redirect_back(fallback_location: root_path)
    else
      @order = Order.find(params[:id])
      @order_details = OrderDetail.where(order_id: @order.id)
      render "orders/show"
    end

  end

    private

      def order_detail_params
        params.require(:order_detail).permit(:making_status)
      end

end
