class ATMPrinter 

  def self.print(transaction_history)
    self.print_header
    self.print_transactions(transaction_history)
  end

  private

  def self.print_transactions(transaction_history)
    transaction_history.each do |transaction|
      self.print_credit(transaction) if transaction.has_key?(:credit)
      self.print_debit(transaction) if transaction.has_key?(:debit)
    end
  end

  def self.print_header
    puts "date || credit || debit || balance"
  end

  def self.print_credit(transaction)
    puts "#{transaction[:date]} || #{format_to_currency(transaction[:credit])} || || #{format_to_currency(transaction[:balance])}"
  end

  def self.print_debit(transaction)
    puts "#{transaction[:date]} || || #{format_to_currency(transaction[:debit])} || #{format_to_currency(transaction[:balance])}"
  end

  def self.format_to_currency(num)
    '%.2f' %  num
  end
end