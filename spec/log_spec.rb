require 'Log'

describe Log do
  let(:log) { described_class.new }

  it 'initializes with an empty transactions array' do
    expect(log.transactions).to be_kind_of(Array)
    expect(log.transactions.length).to eq(0)
  end

  it 'stores correct details for deposits'

  it 'stores correct details for withdrawals'

  it 'stores dates passed as an argument'

  it 'stores the current date if no date argument is given'

  it 'initiates the printing of statements to the console'

end
