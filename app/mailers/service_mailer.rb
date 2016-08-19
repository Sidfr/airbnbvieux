class ServiceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.service_mailer.creation_confirmation.subject
  #
  def creation_confirmation(service)
    @service = service

      mail(
      to:       @service.user.email,
      subject:  "Service #{@service.description} created!"
    )
  end
end
