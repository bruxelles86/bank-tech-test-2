class Account

attr_reader :balance, :log

@date = Time.new

def initialize(balance, log)
  @balance = balance.new
  @log = log.new
end

def deposit(deposit_amount, date=@date)
  @balance.increment(deposit_amount)
  @log.store(deposit_amount, 0, @balance.amount, date)
end

def withdraw(withdrawal_amount)
  @balance.reduce(withdrawal_amount)
end

end
