module WalletActionable
  extend ActiveSupport::Concern

  included do
    has_many :deposite_transactions, -> { where(transaction_type: :deposite) }, class_name: 'Transaction',  as: :to_entity
    has_many :withdraw_transactions, -> { where(transaction_type: :withdraw) }, class_name: 'Transaction', as: :from_entity
  end

  def deposite(amount = 0)
    TransactionService.call(amount, self, self, :deposite)
  end

  def withdraw(amount = 0)
    TransactionService.call(amount, self, self, :withdraw)
  end

  def transfer(amount = 0, reciever)
    ActiveRecord::Base.transaction do
      TransactionService.call(amount, self, reciever, :withdraw)
      TransactionService.call(amount, self, reciever, :deposite)
    end
  end

  def wallet_amount
    WalletBalanceService.call(self)
  end
end