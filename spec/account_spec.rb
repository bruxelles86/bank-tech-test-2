require 'account'

describe Account do
  before(:each) do
    balance = double
    log = double
    printer = double
    sorter = double
    allow(balance).to receive_messages(increment: nil, reduce: nil,
                                       amount: nil, new: balance)
    allow(log).to receive_messages(save: nil, new: log,
                                   transactions: [])
    allow(printer).to receive_messages(print: nil, new: printer)
    @account = Account.new(balance, log, printer, sorter)
  end

  it 'has a balance' do
    expect(@account.balance).to be_truthy
  end

  it 'has a record of transactions' do
    expect(@account.log).to be_truthy
  end

  it 'initiates deposits' do
    @account.deposit(10)
    expect(@account.balance).to have_received(:increment).with(10)
  end

  it 'initiates the storage of transaction data after a deposit' do
    @account.deposit(10)
    expect(@account.log).to have_received(:save).with(any_args)
  end

  it 'initiates the storage of transaction data after a withdrawal' do
    @account.withdraw(10)
    expect(@account.log).to have_received(:save).with(any_args)
  end

  it 'initiates withdrawals' do
    @account.withdraw(10)
    expect(@account.balance).to have_received(:reduce).with(10)
  end

  it 'initiates the printing of a statement to the console' do
    @account.print_statement
    expect(@account.printer).to have_received(:print).with(instance_of(Array))
  end

  it 'withdrawals log today\'s date if none is given as an argument' do
    @account.withdraw(10)
    expect(@account.log).to have_received(:save).with(
      Time.now.strftime('%m/%d/%Y'), anything, anything, anything
    )
  end

  it 'deposits log today\'s date if none is given as an argument' do
    @account.deposit(10)
    expect(@account.log).to have_received(:save).with(
      Time.now.strftime('%m/%d/%Y'), anything, anything, anything
    )
  end

  it 'withdrawals log date passed as argument' do
    @account.withdraw(10, '01/01/2000')
    expect(@account.log).to have_received(:save).with(
      '01/01/2000', anything, anything, anything
    )
  end

  it 'deposits log date passed as argument' do
    @account.deposit(10, '01/01/2000')
    expect(@account.log).to have_received(:save).with(
      '01/01/2000', anything, anything, anything
    )
  end
end
