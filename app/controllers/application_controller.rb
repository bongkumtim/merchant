class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_in, keys: [:full_name, :email])
  devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :business_type, :address, :company_name,:company_no, :email, :password, :password_confirmation]) 
  devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :business_type, :address, :company_name,:company_no, :email, :password, :password_confirmation, :current_password])
  end
end
