class Shop < ApplicationRecord
  validates :name,
            presence: true,
            uniqueness: true,
            format: { with: /\w+[a-zA-Z]{3,9}/ }
  validates :products_count, numericality: { only_integer: true }
  validates :orders_count, numericality: { only_integer: true }
  validates :user_id, uniqueness: true
  validates :user_can_not_be_admin, on: :create
  belongs_to :user

  private

  def user_can_not_be_admin
    if user.role == 0
      errors.add(:user_id, "can not be admin")
    end
  end
end
