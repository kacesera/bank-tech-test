class ATMPrinter 

  def self.print(transaction_history)
    puts "date || credit || debit || balance"
    transaction_history.each do |transaction|
      if transaction.has_key?(:credit)
        puts "#{transaction[:date]} || #{format_to_currency(transaction[:credit])} || || #{format_to_currency(transaction[:balance])}"
      else
        puts "#{transaction[:date]} || || #{format_to_currency(transaction[:debit])} || #{format_to_currency(transaction[:balance])}"
      end
    end
  end

  private

  def self.format_to_currency(num)
    '%.2f' %  num
  end
end