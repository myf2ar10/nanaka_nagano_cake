class Public::SearchesController < ApplicationController

  def items_search
    @genres = Genre.all
    @items = Item.looks(params[:search], params[:word]).where(is_active: true).page(params[:page])
  end

  def genre_items_search
    @genres = Genre.all
    @genre = Genre.find(params[:genre_id])
    @items = @genre.items.page(params[:page])
  end

end
