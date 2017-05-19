class PaymentType < ApplicationRecord

    has_many :orders

  def self.payment_types
      all.map(&:name)
  end
end
