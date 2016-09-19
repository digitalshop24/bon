class Subscription < ApplicationRecord
  validates :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates_uniqueness_of :email

  #after_create :send_email

  def send_email
    SubscriptionMailer.send_subscribe_email(self).deliver
  end
end
