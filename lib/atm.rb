class ATM

  def initialize
    @balance = 0
    @transactions = []
  end

  def check_balance
    @balance.round(2)
  end

  def deposit(cash_amount, date = format_date)
    @balance += cash_amount
    add_transaction('credit', cash_amount, date)
  end

  def withdraw(cash_amount, date = format_date)
    @balance -= cash_amount
    add_transaction('debit', cash_amount, date)
  end

  def transaction_history
    @transactions.reverse
  end

  def print_transaction_history
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

  def add_transaction(type, cash_amount, date)
    @transactions << { 
      "#{type}": cash_amount,
      date: date,
      balance: @balance
    }
  end

  def format_to_currency(num)
    '%.2f' %  num
  end

  def format_date
    Date.today.strftime('%d/%m/%Y')
  end
end
