class Public::MembersController < ApplicationController
  def show
  end

  def edit
  end

  def confirm_quit
  end
  
  private
  
  def member_params
     params.require(:member).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :post_code, :address, :telephone_number)
  end
  
end
