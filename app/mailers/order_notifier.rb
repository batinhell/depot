class OrderNotifier < ActionMailer::Base
  default from: "admin@depot.com" 

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.recieved.subject
  #
  def received(order)
    @order = order
    mail to: @order.email, subject: "Подтверждение заказа"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order = order
    mail to: @order.email, subject: "Подтверждение отправки"
  end
end
