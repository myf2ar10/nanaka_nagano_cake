class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genre = Genre.all
  end
  def create
    item = Item.new(item_params)
    item.save
    flash[:notice] = "新規登録に成功しました。"
    redirect_to admin_item_path(item.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    item = Item.find(params[:id])
    item.update(item_params)
    flash[:notice] = "編集に成功しました。"
    redirect_to admin_item_path(item.id)
  end
  
  private
  
  def item_params
    params.require(:item).permit(:genre_id, :name, :detail, :price, :is_active, :image)
  end
  
end
