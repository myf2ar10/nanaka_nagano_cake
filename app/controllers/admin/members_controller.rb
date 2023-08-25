class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      flash[:notice] = "会員情報を変更しました"
      redirect_to admin_member_path(@member.id)
    else
      @member = Member.find(params[:id])
      flash[:notice] = "会員情報の変更に失敗しました"
      render :edit
    end
  end

  def index
    @members = Member.page(params[:page])
  end

  private

    def member_params
      params.require(:member).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :post_code, :address, :telephone_number, :email, :is_deleted)
    end

end
