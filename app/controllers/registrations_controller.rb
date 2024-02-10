class RegistrationsController < Devise::RegistrationsController

    before_action :validate_admin , only: [:new]
    private

    def sign_up_params
      params.require(:user).permit(:name , :username , :email , :password , :password_confirmation ,:role, :image)
    end

    def account_update_params
      params.require(:user).permit(:name , :username , :email , :password , :password_confirmation , :current_password , :image)
    end
    def validate_admin
      if user_signed_in? && current_user.role == "admin"
        redirect_to new_user_registration_path
      else
        redirect_to root_path
      end
    end

end