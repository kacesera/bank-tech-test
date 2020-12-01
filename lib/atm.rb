require_relative 'atm_printer'
require_relative 'transaction'

class ATM

  def initialize(transaction_class = Transaction, atm_printer = ATMPrinter)
    @atm_printer = atm_printer
    @transaction_class = transaction_class
    @balance = 0
    @transactions = []
  end

  def check_balance
    @balance.round(2)
  end

  def deposit(cash_amount)
    @balance += cash_amount
    add_transaction('credit', cash_amount)
  end

  def withdraw(cash_amount)
    @balance -= cash_amount
    add_transaction('debit', cash_amount)
  end

  def transaction_history
    @transactions.reverse
  end

  def print_transaction_history
    @atm_printer.print(transaction_history)
  end

  private

  def add_transaction(type, cash_amount)
    @transactions << @transaction_class.new('credit', cash_amount, @balance)
  end
end
