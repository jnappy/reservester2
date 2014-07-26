class RegistrationsController < Devise::RegistrationsController

  private

    def sign_up_params
      allow = [:email, :first_name, :last_name, :password, :password_confirmation]
      params.require(:user).permit(allow)
    end

end
