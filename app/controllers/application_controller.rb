class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale, :set_mailer_host

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  def set_locale
    I18n.locale = I18n.default_locale
  end

  def set_mailer_host
    ActionMailer::Base.default_url_options = { host: request.host_with_port }
  end

end
