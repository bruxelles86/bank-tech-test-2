require 'printer'

describe Printer do
    before(:each) do
    sorter = double("sorter")
    allow(sorter).to receive(:new) { sorter }
    allow(sorter).to receive(:sort) { [] }
    @printer = Printer.new(sorter)
  end

  let(:transactions) { [] }

  it 'correctly prints a statement with deposits' do
      sorter = double("sorter")
      allow(sorter).to receive(:new) { sorter }
      allow(sorter).to receive(:sort).with(anything) { [{ date: '01/01/2000',
                                                   credit: 10.00, debit: 0,
                                                   balance: 10.00 }] }
                                                   @printer = Printer.new(sorter)
      expect { @printer.print(transactions) }.to output(
      'Date || Credit || Debit || Balance'\
      "\n01/01/2000 || 10.00 ||  || 10.00\n"
      ).to_stdout
  end

  it 'correctly prints a statement with withdrawals' do
      # allow(sorter).to receive(:sort).with(anything) { [{ date: '01/01/2000',
      #                                                credit: 0, debit: 15.00,
      #                                                balance: 20.00 }] }
      # @printer = Printer.new(sorter)
      # allow(sorter).to receive(:sort) { sorter }
      # log = instance_double("log", :transactions => [{ date: '01/01/2000',
      #                                                credit: 0, debit: 15.00,
      #                                                balance: 20.00 }] )
      # expect { @printer.print(log.transactions) }.to output(
      # 'Date || Credit || Debit || Balance'\
      # "\n01/01/2000 ||  || 15.00 || 20.00\n"
      # ).to_stdout
  end

  it 'calls sorter to put transactions in reverse chronological order' do
    @printer.print(transactions)
    expect(@printer.sorter).to have_received(:sort)
  end
end
