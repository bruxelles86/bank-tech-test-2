class Account

attr_reader :balance, :log

def initialize(balance, log)
  @balance = balance.new
  @log = log.new
end

def deposit(deposit_amount)
  @balance.increment(deposit_amount)
end

def withdraw(withdrawal_amount)
  @balance.reduce(withdrawal_amount)
end

end
