class Users::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?

    if resource.persisted?
      set_flash_message! :notice, :signed_up

      redirect_to new_user_session_path,
                  notice: "登録が完了しました。ログインしてください。"
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end
end
