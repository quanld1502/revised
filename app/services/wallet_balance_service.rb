class WalletBalanceService < BaseService
  def initialize(entity)
    @entity = entity
  end

  def call
    @entity.deposite_transactions.sum(:amount) - @entity.withdraw_transactions.sum(:amount)
  end
end