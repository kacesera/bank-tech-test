class ATMPrinter 

  def self.print(transaction_history)
    print_header
    print_transactions(transaction_history)
  end

  def self.print_transactions(transaction_history)
    transaction_history.each do |transaction|
      print_credit(transaction) if transaction.deposit?
      print_debit(transaction) if transaction.withdrawal?
    end
  end

  def self.print_header
    puts "date || credit || debit || balance"
  end

  def self.print_credit(trans)
    puts "#{trans.date} || #{to_currency(trans.amount)} || || #{to_currency(trans.balance)}"
  end

  def self.print_debit(trans)
    puts "#{trans.date} || || #{to_currency(trans.amount)} || #{to_currency(trans.balance)}"
  end

  def self.to_currency(num)
    '%.2f' % num
  end
end
