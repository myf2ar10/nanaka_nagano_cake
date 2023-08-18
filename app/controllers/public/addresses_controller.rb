class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end
  
  def create
    address = Address.new(address_params)
    address.save
    flash[:notice] = "住所を新規登録しました。"
    redirect_to address_path
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    address = Address.find(params[:id])
    address.update(address_params)
    flash[:notice] = "住所の編集が完了しました。"
    redirect_to address_path(address.id)
  end
  
  def destroy
    address = Address.find(params[:id])
    address.destroy
    flash[:notice] = "住所を削除しました。"
    redirect_to address_path
  end
  
  private
  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end
  
end
