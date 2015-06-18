class RegistrationsController < Devise::RegistrationsController

  def create
    #UserMailer.welcome_mail(params[:user][:name],
    #                        params[:user][:email]).deliver_later
    super
  end
  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, 
                                    :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, 
                    :password_confirmation, :current_password)
  end
end