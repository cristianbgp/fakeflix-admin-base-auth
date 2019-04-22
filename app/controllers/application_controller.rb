class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :except => [:show, :index]
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  include Pundit

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to "/"
  end
end
