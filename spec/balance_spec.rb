require 'balance'

describe Balance do
  let(:balance) { described_class.new }

  it 'initializes with an amount of zero' do
    expect(balance.amount).to eq(0)
  end

  it 'increments by amounts deposited' do
    balance.increment(10)
    expect(balance.amount).to eq(10)
  end

  it 'reduces by amounts withdrawn'

end
