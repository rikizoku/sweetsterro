class ApplicationController < ActionController::Base



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :post_code, :address, :phone_number])
  end
end
