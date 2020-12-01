class ATM

  def initialize
    @balance = 0
    @transactions = []
  end

  def check_balance
    @balance
  end

  def deposit(cash, date = format_date)
    @balance += cash
    @transactions << { 
      amount: cash,
      date: date,
      balance: @balance
    }
  end

  def withdraw(cash)
    @balance -= cash
  end

  def transaction_history
    @transactions
  end

  private

  def format_date
    Date.today.strftime('%d/%m/%Y')
  end

end