require 'account'

describe Account do

  before(:each)do
    balance = double
    statement = double
    allow(balance).to receive(:new) { true }
    allow(statement).to receive(:new) { true }
    @account = Account.new(balance, statement)
  end

  # let(:account) { described_class.new(balance, statement) }

  it 'has a balance' do
    expect(@account.balance).to be_truthy
  end

  it 'has a record of transactions'

  it 'initiates deposits'

  it 'initiates the storage of transaction data after a deposit'

  it 'initiates the storage of transaction data after a withdrawal'

  it 'initiates withdrawals'

  it 'records withdrawal details'

  it 'calls statement to initiate the printing of a statement to the console'
end
