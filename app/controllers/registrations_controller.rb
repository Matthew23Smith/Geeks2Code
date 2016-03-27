class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :current_password)
  end

  def after_inactive_sign_up_path_for(resource_or_scope)
    session["user_return_to"] || new_user_session_path
  end
  
end
