class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
    @genres = Genre.all
    @item.is_active = true
  end
  def create
    item = Item.new(item_params)
    if item.save
      flash[:notice] = "新規登録に成功しました。"
      redirect_to admin_item_path(item.id)
    else
      flash[:notice] = "新規登録に失敗しました。"
      @item = Item.new
      @genres = Genre.all
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      flash[:notice] = "編集に成功しました。"
      redirect_to admin_item_path(item.id)
    else
      flash[:notice] = "編集に失敗しました。"
      @item = Item.find(params[:id])
      @genres = Genre.all
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :detail, :price, :is_active, :image)
  end

end
