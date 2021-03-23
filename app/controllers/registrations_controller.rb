class RegistrationsController < Devise::RegistrationsController
    
    private

    # sets strong params for the signup
    def sign_up_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # sets strong params for changing password
    def account_update_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
    end
end