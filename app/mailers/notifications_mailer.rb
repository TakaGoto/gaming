class NotificationsMailer < ActionMailer::Base
  default :from => "tak.yuki@gmail.com"
  default :to => "tak.yuki@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "#{message.subject}")
  end
end
