require 'sorter'

describe Sorter do
  it 'sorts transactions into reverse chronological order' do
    sorter = Sorter.new
    expect(sorter.sort([{ date: '01/01/2017' },{ date: '15/07/2000' },
                 { date: '11/08/2005' }]
                )).to eq([{ date: '15/07/2000' },{ date: '11/08/2005' },
                        { date: '01/01/2017' }]
                )
  end
end
