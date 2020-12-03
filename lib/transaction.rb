require 'date'

class Transaction

  def initialize(type, amount, balance, date = format_date)
    @type = type
    @amount = amount
    @date = date
    @balance = balance
  end

  def deposit?
    @type == 'credit'
  end

  def withdrawal?
    @type == 'debit'
  end

  private

  def format_date
    Date.today.strftime('%d/%m/%Y')
  end
end
