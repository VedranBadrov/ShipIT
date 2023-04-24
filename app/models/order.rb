class Order < ApplicationRecord
    belongs_to :user
    validates :user_id, presence: true
    before_validation :set_default_order_status, if: :new_record?

    enum order_status: [:Pending, :Accepted, :InProgress, :Completed, :Canceled]
    after_initialize :set_default_order_status, if: :new_record?

    def set_default_order_status
      self.order_status ||= :Pending
    end
end
 