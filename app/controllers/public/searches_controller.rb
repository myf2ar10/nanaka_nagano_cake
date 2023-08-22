class Public::SearchesController < ApplicationController

  def items_search
    @genre = @genres = Genre.all
    @items = Item.looks(params[:search], params[:word]).page(params[:page])

  end
end
