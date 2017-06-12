# records details of all transactions
class Log
  attr_reader :transactions
  def initialize
    @transactions = []
  end

  def save(date, credit_amount, debit_amount, new_balance)
    @transactions.push(date: date, credit: credit_amount,
                       debit: debit_amount, balance: new_balance)
  end
end
