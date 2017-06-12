# acts as a user interface
class Account
  attr_reader :balance, :log, :printer

  @date = Time.now.strftime('%m/%d/%Y')

  def initialize(balance, log, printer)
    @balance = balance.new
    @log = log.new
    @printer = printer.new
  end

  def deposit(deposit_amount, date=@date)
    @balance.increment(deposit_amount)
    @log.store(date, deposit_amount, 0, @balance.amount)
  end

  def withdraw(withdrawal_amount, date=@date)
    @balance.reduce(withdrawal_amount)
    @log.store(date, 0, withdrawal_amount, @balance.amount)
  end

  def print_statement
    @printer.print
  end
end
