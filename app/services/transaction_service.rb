class TransactionService < BaseService
  def initialize(amount, from_entity, to_entity, type)
    @from_entity = from_entity
    @to_entity = to_entity
    @amount = amount
    @type = type
  end

  def call
    Transaction.create!(from_entity: @from_entity, to_entity: @to_entity, transaction_type: @type, amount: @amount)
  end
end