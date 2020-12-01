class ATM

  def initialize
    @balance = 0
    @transactions = []
  end

  def check_balance
    @balance
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

  private

  def add_transaction(type, cash_amount, date)
    @transactions << { 
      "#{type}": cash_amount,
      date: date,
      balance: @balance
    }
  end

  def format_date
    Date.today.strftime('%d/%m/%Y')
  end

end