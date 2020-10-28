class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname, :first_name, :second_name, :kana_first_name, :kana_second_name, :birthday]
    )
  end
end
