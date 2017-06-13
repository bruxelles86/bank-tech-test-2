require 'account'

describe Account do
  let(:account) { described_class.new(Balance, Log, Printer, Sorter) }

  it 'prints correct statement matching task acceptance criteria' do
    account.deposit(1000, '10/01/2012')
    account.deposit(2000, '13/01/2012')
    account.withdraw(500, '14/01/2012')
    expect { account.print_statement }.to output(
      'Date || Credit || Debit || Balance'\
    "\n14/01/2012 ||  || 500.00 || 2500.00"\
    "\n13/01/2012 || 2000.00 ||  || 3000.00"\
    "\n10/01/2012 || 1000.00 ||  || 1000.00\n"
    ).to_stdout
  end
end
