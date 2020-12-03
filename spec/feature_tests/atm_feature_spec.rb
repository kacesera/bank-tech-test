require 'atm'

describe 'ATM' do
  let(:atm) { ATM.new }
  
  before :each do
    atm.deposit(500)
  end

  it 'lets user deposit money' do
    expect(atm.check_balance).to eq 500
  end

  it 'lets user withdraw money' do
    atm.withdraw(25)
    expect(atm.check_balance).to eq 475
  end
end