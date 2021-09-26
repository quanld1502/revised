class Transaction < ApplicationRecord
  belongs_to :from_entity, polymorphic: true
  belongs_to :to_entity, polymorphic: true

  enum transaction_type: { deposite: 0, withdraw: 1 }, _prefix: :transaction


  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  validate :wallet_balance_can_not_negative

  def amount_transaction
    transaction_withdraw? ? - amount : amount
  end

  private

  def wallet_balance_can_not_negative
    if transaction_withdraw? && WalletBalanceService.call(from_entity).negative?
      errors.add(:base, 'The balance can not negative')
    end
  end
end