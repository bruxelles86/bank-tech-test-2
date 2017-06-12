class Balance
  attr_reader :amount
  def initialize
    @amount = 0
  end

  def increment(amount_to_increase)
    @amount += amount_to_increase
  end
end
