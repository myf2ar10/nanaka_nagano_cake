class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.where(member_id: current_member.id)
    @address = Address.new
  end
  
  def create
      address = Address.new(address_params)
    if address.save
      flash[:notice] = "住所を新規登録しました。"
      redirect_to address_path
    else
      @addresses = Address.where(member_id: current_member.id)
      @address = Address.new
      flash[:notice] = "住所の新規登録に失敗しました。"
      render index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def update
       address = Address.find(params[:id])
    if address.update(address_params)
       flash[:notice] = "住所の編集が完了しました。"
       redirect_to addresses_path
    else
      @address = Address.find(params[:id])
      flash[:notice] = "住所の編集に失敗しました。"
      render edit
    end
  end
  
  def destroy
       address = Address.find(params[:id])
    if address.destroy
       flash[:notice] = "住所を削除しました。"
       redirect_to addresses_path
    else
       flash[:notice] = "住所を削除に失敗しました。"
       @addresses = Address.where(member_id: current_member.id)
       @address = Address.new
       render index
    end
  end
  
  private
  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end
  
end
