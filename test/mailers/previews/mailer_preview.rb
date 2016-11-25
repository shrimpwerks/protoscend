class MailerPreview < ActionMailer::Preview
  def assigned_route_preview
    Mailer.assigned_route_mail(User.first, Route.first)
  end
end
