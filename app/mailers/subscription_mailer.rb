class SubscriptionMailer < ApplicationMailer
  default from: 'bon@gmail.com'

  def send_subscribe_email(subscriber)
    @subscriber = subscriber
    mail( :to => @subscriber.email,
          :subject => 'Спасибо, что подписались на наши обновления!' )
  end
end
