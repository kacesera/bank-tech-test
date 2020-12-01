class ATM

  def initialize
    @balance = 0
    @transactions = []
  end

  def check_balance
    @balance
  end

  def deposit(cash)
    @balance += cash
    @transactions << { amount: cash }
  end

  def withdraw(cash)
    @balance -= cash
  end

  def transaction_history
    @transactions
  end

end