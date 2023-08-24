class Public::SearchesController < ApplicationController

  def items_search
    @genres = Genre.all
    @items = Item.looks(params[:search], params[:word]).page(params[:page]).per(8)
    @items_count = Item.looks(params[:search], params[:word]).count
  end

  def genre_items_search
    @genres = Genre.all
    @genre = Genre.find(params[:genre_id])
    @items = @genre.items.looks(params[:search], params[:word]).page(params[:page]).per(8)
    @items_count = @genre.items.looks(params[:search], params[:word]).count
    @genre_name = @genre.name
  end

end
