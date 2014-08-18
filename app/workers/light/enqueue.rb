module Light
  class Enqueue
    include Sidekiq::Worker
    sidekiq_options :queue => :lightair
  
    def perform(email)
      date = Date.today.strftime("%Y%m")
      news = Light::Newsletter.order_by([:sent_on, :desc]).first
      Light::UserMailer.welcome_message(email, news.content, 'testing', 'Test User').deliver
    end
  end
end
