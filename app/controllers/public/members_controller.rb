class Public::MembersController < ApplicationController
  before_action :authenticate_member!, only: [:show, :edit, :update, :quit]

  def show
    @member = current_member
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    if @member.update(member_params)
      flash[:notice] = "会員情報を更新しました"
      redirect_to members_mypage_path
    else
      @member = current_member
      flash.now[:notice] = "会員情報の変更に失敗しました"
      render :edit
    end
  end

  def quit
    @member = current_member
    @member.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def confirm_quit
  end

  private

  def member_params
     params.require(:member).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :email, :post_code, :address, :telephone_number, :is_deleted)
  end

end
