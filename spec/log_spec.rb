require 'Log'

describe Log do
  let(:log) { described_class.new }

  it 'initializes with an empty transactions array' do
    expect(log.transactions).to be_kind_of(Array)
    expect(log.transactions.length).to eq(0)
  end

  it 'stores correct details for deposits' do
    log.save('10/06/2017', 10, 0, 100)
    expect(log.transactions[0][:date]).to eq('10/06/2017')
    expect(log.transactions[0][:credit]).to eq(10)
    expect(log.transactions[0][:debit]).to eq(0)
    expect(log.transactions[0][:balance]).to eq(100)
  end

  it 'stores correct details for withdrawals' do
    log.save('10/06/2017', 0, 100, 0)
    expect(log.transactions[0][:date]).to eq('10/06/2017')
    expect(log.transactions[0][:credit]).to eq(0)
    expect(log.transactions[0][:debit]).to eq(100)
    expect(log.transactions[0][:balance]).to eq(0)
  end

  it 'stores dates passed as an argument'

  it 'stores the current date if no date argument is given'

  it 'initiates the printing of statements to the console'

end
