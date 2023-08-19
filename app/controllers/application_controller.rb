class ApplicationController < ActionController::Base
<<<<<<< HEAD
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :post_code, :address, :telephone_number, :is_deleted])
=======

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_orders_path
    when Member
      members_mypage_path
    end
>>>>>>> 3c9a97e856aaaad8a0ae1e037056de5e663d3b12
  end

end
