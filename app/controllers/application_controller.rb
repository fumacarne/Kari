class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected

    def authorize_request(kind = nil)
        unless kind.include?(current_user.role)
        redirect_to posts_path, notice: "You are not authorized to perform this action"
        end
    end
  
     def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :age, images_attributes:[:url, :id]])
       devise_parameter_sanitizer.permit(:account_update, keys: [:name, :gender, :age, images_attributes:[:url, :id]])
     end

  end
