require_relative './balance.rb'
require_relative './log.rb'
require_relative './printer.rb'

# acts as a user interface
class Account
  attr_reader :balance, :log, :printer

  def initialize(balance, log, printer)
    @balance = balance.new
    @log = log.new
    @printer = printer.new
  end

  def deposit(deposit_amount, date=Time.now.strftime('%m/%d/%Y'))
    @balance.increment(deposit_amount)
    @log.save(date, deposit_amount, 0, @balance.amount)
  end

  def withdraw(withdrawal_amount, date=Time.now.strftime('%m/%d/%Y'))
    @balance.reduce(withdrawal_amount)
    @log.save(date, 0, withdrawal_amount, @balance.amount)
  end

  def print_statement
    @printer.print(@log.transactions)
  end
end
