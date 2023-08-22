class Public::SearchesController < ApplicationController

  def items_search
    @genres = Genre.all
    @items = Item.looks(params[:search], params[:word]).page(params[:page])

  end
end
