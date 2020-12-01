class ATM

  def initialize
    @balance = 0
  end

  def check_balance
    @balance
  end

  def deposit(cash)
    @balance += cash
  end

  def withdraw(cash)
    @balance -= cash
  end

end