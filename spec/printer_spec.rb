require 'printer'

describe Printer do
  let(:printer) { described_class.new }

  it 'correctly prints a statement with deposits' do
      log = instance_double("log", :transactions => [{ date: '01/01/2000',
                                                     credit: 10.00, debit: 0,
                                                     balance: 10.00 }] )
      expect { printer.print(log.transactions) }.to output(
      'Date || Credit || Debit || Balance'\
      "\n01/01/2000 || 10.00 ||  || 10.00\n"
      ).to_stdout
  end

  it 'correctly prints a statement with withdrawals' do
      log = instance_double("log", :transactions => [{ date: '01/01/2000',
                                                     credit: 0, debit: 15.00,
                                                     balance: 20.00 }] )
      expect { printer.print(log.transactions) }.to output(
      'Date || Credit || Debit || Balance'\
      "\n01/01/2000 ||  || 15.00 || 20.00\n"
      ).to_stdout
  end

  it 'prints statements in reverse chronological order' do
      log = instance_double("log", :transactions => [{ date: '01/01/2017',
                                                    credit: 0, debit: 15.00,
                                                    balance: 20.00 },
                                                    { date: '15/07/2000',
                                                    credit: 0, debit: 15.00,
                                                    balance: 20.00 },
                                                    { date: '11/08/2005',
                                                    credit: 0, debit: 15.00,
                                                    balance: 20.00 }] )
      expect { printer.print(log.transactions) }.to output(
      'Date || Credit || Debit || Balance'\
      "\n15/07/2000 ||  || 15.00 || 20.00\n"\
      "\n11/08/2005 ||  || 15.00 || 20.00\n"\
      "\n01/01/2017 ||  || 15.00 || 20.00\n"
      ).to_stdout
  end
end
