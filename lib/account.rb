class Account
  attr_reader :balance, :log

  @date = Time.now.strftime('%m/%d/%Y')

  def initialize(balance, log, printer)
    @balance = balance.new
    @log = log.new
  end

  def deposit(deposit_amount, date=@date)
    @balance.increment(deposit_amount)
    @log.store(deposit_amount, 0, @balance.amount, date)
  end

  def withdraw(withdrawal_amount, date=@date)
    @balance.reduce(withdrawal_amount)
    @log.store(0, withdrawal_amount, @balance.amount, date)
  end

  def print_statement
    @log.print
  end
end
