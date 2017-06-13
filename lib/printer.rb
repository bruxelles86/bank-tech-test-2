# prints account statements to the console
class Printer
  attr_reader :sorter

  def initialize(sorter)
    @sorter = sorter.new
  end

  def print(transactions)
    sorted_transactions = @sorter.sort(transactions)
    puts 'Date || Credit || Debit || Balance'
    sorted_transactions.each do |row|
      if row[:credit] > 0
        puts "#{row[:date]} || #{format('%.2f', row[:credit])} ||  || #{format('%.2f', row[:balance])}"
      elsif row[:debit] > 0
        puts "#{row[:date]} ||  || #{format('%.2f', row[:debit])} || #{format('%.2f', row[:balance])}"
      end
    end
  end
end
