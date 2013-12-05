class RegistrationsController < Devise::RegistrationsController
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation, :current_password)}
  end

  def after_sign_in_path_for(resource)
    root_path
  end

end
