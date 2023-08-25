class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def items_search
    @items = Item.looks(params[:search], params[:word], true).page(params[:page])
  end

end
