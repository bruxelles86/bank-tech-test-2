# prints account statements to the console
class Printer
  def print(transactions)
    puts 'Date || Credit || Debit || Balance'
    transactions.each do |row|
      if row[:credit] > 0
        puts "#{row[:date]} || #{row[:credit]} ||  || #{row[:balance]}"
      elsif row[:debit] > 0
        puts "#{row[:date]} ||  || #{row[:debit]} || #{row[:balance]}"
      end
    end
  end
end
