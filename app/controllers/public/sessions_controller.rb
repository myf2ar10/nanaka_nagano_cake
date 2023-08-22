# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :is_deleted?, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

    def is_deleted?
      @member = Member.find_by(email: params[:member][:email])
      return if !@member
      if @member.valid_password?(params[:member][:password])
        if @member.is_deleted == true
          redirect_to new_member_registration_path
        else
          return
        end
      end
    end

end
