class MailerPreview < ActionMailer::Preview
  def assigned_route_preview
    Mailer.assigned_route(User.first, Route.first)
  end
end
