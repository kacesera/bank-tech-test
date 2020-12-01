require_relative 'atm_printer'
require_relative 'transaction'

class ATM

  def initialize(atm_printer = ATMPrinter)
    @atm_printer = atm_printer
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
    @atm_printer.print(transaction_history)
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
