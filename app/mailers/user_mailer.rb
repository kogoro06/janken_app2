class UserMailer < ApplicationMailer
    def reset_password_instructions
      @resource = params[:resource]
      @token = params[:token]

      # デバッグ用にログ出力
      Rails.logger.debug("UserMailer#reset_password_instructions - @resource: #{@resource.inspect}")
      Rails.logger.debug("UserMailer#reset_password_instructions - @token: #{@token.inspect}")

      if @resource.nil?
        Rails.logger.error("User resource is nil")
        raise "User resource is nil"
      end

      mail(
        to: @resource.email,
        subject: "Reset Your Password"
      ) do |format|
        format.html { render "devise/mailer/reset_password_instructions" }
        format.text { render "devise/mailer/reset_password_instructions" }
      end
    end
end
