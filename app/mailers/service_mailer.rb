class ServiceMailer < ApplicationMailer

  def send_error(service)
    @service = service
    mail(to: ENV['ADMIN_MAILER'], subject: "ALERT: #{service.name} is down")
  end
end
