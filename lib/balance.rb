# maintains a record of the amount of money currently in an account
class Balance
  attr_reader :amount
  def initialize
    @amount = 0.00
  end

  def increment(amount_to_increase)
    @amount += amount_to_increase.to_f
  end

  def reduce(amount_to_reduce)
    @amount -= amount_to_reduce.to_f
  end
end
