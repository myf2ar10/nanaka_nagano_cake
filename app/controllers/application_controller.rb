class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_orders_path
    when Member
      members_mypage_path
    end
  end

end
