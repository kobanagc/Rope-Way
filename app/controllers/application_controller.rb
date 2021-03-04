class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :sex_id, :age, :residence_id, :rope_patron_id])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :self_pr, :sex_id, :age, :residence_id, :rope_patron_id, :image])
  end
end
