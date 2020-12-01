class ATM

  def initialize
    @balance = 0
  end

  def deposit(cash)
    @balance += cash
  end

  def check_balance
    @balance
  end

end