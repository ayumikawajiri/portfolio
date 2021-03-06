class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_all_states
  before_action :configure_permitted_parameters, if: :devise_controller?

  add_breadcrumb "TOP", :root_path

  def get_all_states
  @states = City.all
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :admin])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :admin])
    end
end
