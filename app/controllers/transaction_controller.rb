class TransactionController< ApplicationController
  def index
    @transactions = Transaction.includes(:from_entity, :to_entity).all
    @users = User.includes(:deposite_transactions, :withdraw_transactions).all
    @teams = Team.includes(:deposite_transactions, :withdraw_transactions).all
  end
end