class Account

attr_reader :balance, :log

def initialize(balance, log)
  @balance = balance.new
  @log = log.new
end

end
