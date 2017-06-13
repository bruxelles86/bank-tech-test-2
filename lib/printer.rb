# prints account statements to the console
class Printer
  def initialize(sorter)
    @sorter = sorter.new
  end
  def print(transactions)
    puts 'Date || Credit || Debit || Balance'
    transactions.each do |row|
      if row[:credit] > 0
        puts "#{row[:date]} || #{'%.2f' % row[:credit]} ||  || #{'%.2f' % row[:balance]}"
      elsif row[:debit] > 0
        puts "#{row[:date]} ||  || #{'%.2f' % row[:debit]} || #{'%.2f' % row[:balance]}"
      end
    end
  end
end
