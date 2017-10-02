class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
      before_action :configure_permitted_parameters, if: :devise_controller?
  
      protected
  
          def configure_permitted_parameters
              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :avatar, :avatar_original_w, :avatar_original_h,:avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h) }
          end
          
  end
  
