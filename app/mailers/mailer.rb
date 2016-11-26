class Mailer < ApplicationMailer
  default from: 'team@protoscend.com'
  layout 'mailer'

  def assigned_route_mail(user, route)
    @user = user
    @route = route

    mail(to: @user.email, subject: "You've been assigned a route")
  end
end
