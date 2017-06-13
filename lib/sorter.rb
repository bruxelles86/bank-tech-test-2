require 'date'

# sorts transactions into reverse chronological order
class Sorter
  def sort(transactions)
    sorted_transactions = transactions.sort_by { |e| Date.parse(e[:date]) }
    sorted_transactions.reverse
  end
end
