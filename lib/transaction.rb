require 'date'

class Transaction

  def initialize(type, amount, balance, date = format_date)
    @type = type
    @amount = amount
    @date = date
    @balance = balance
  end

  def balance
    @balance
  end

  def amount
    @amount
  end

  def date
    @date
  end

  def is_a_deposit?
    @type == 'credit'
  end

  def is_a_withdrawal?
    @type == 'debit'
  end

  private

  def format_date
    Date.today.strftime('%d/%m/%Y')
  end
end
