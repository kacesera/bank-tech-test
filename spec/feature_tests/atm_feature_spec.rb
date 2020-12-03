require 'atm'

describe 'ATM' do
  let(:atm) { ATM.new }
  
  before :each do
    atm.deposit(500)
    @today = Date.today.strftime('%d/%m/%Y')
  end

  it 'lets user deposit money' do
    expect(atm.check_balance).to eq 500
  end

  it 'lets user withdraw money' do
    atm.withdraw(25)
    expect(atm.check_balance).to eq 475
  end

  it 'shows the user their transaction history' do
    atm.withdraw(500)
    expect{ atm.print_transaction_history }.to output("date || credit || debit || balance\n#{@today} || || 500.00 || 0.00\n#{@today} || 500.00 || || 500.00\n").to_stdout
  end
end
