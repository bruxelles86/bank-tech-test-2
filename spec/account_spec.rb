require 'account'

describe Account do
  let(:balance) { 'Dummy balance' }
  let(:statement) { 'Dummy statement' }
  let(:account) { described_class.new(balance, statement) }

  it 'has a balance' do
    expect(account.balance).to be_truthy
  end

  it 'has a record of transactions'

  it 'initiates deposits'

  it 'initiates the storage of transaction data after a deposit'

  it 'initiates the storage of transaction data after a withdrawal'

  it 'initiates withdrawals'

  it 'records withdrawal details'

  it 'calls statement to initiate the printing of a statement to the console'
end
