class Order < ApplicationRecord
    belongs_to :user
    validates :user_id, presence: true
    before_validation :set_default_order_status, if: :new_record?

    enum order_status: [:Pending, :Accepted, :InProgress, :Completed, :Canceled]
    after_initialize :set_default_order_status, if: :new_record?

    def set_default_order_status
      self.order_status ||= :Pending
    end

    def costcalculator
      cost_per_item = 1.00
      cost_per_kg = 2.00
      cost_per_km = 0.10
      cost = (quantity * cost_per_item) + (weight * cost_per_kg) + (distance * cost_per_km)
      return cost
    end
    
end
 