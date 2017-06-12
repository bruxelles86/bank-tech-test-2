require 'account'

describe Account do

  before(:each)do
    balance = double
    log = double
    allow(balance).to receive(:new) { balance }
    allow(log).to receive(:new) { log }
    @account = Account.new(balance, log)
  end

  it 'has a balance' do
    expect(@account.balance).to be_truthy
  end

  it 'has a record of transactions' do
    expect(@account.log).to be_truthy
  end

  it 'initiates deposits' do
    allow(@account.balance).to receive(:increment)
    @account.deposit(10)
    expect(@account.balance).to have_received(:increment).with(10)
  end

  it 'initiates the storage of transaction data after a deposit'

  it 'initiates the storage of transaction data after a withdrawal'

  it 'initiates withdrawals'

  it 'records withdrawal details'

  it 'calls log to initiate the printing of a statement to the console'
end
