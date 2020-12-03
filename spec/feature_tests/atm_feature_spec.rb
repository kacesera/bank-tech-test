require 'atm'

describe 'ATM' do
  let(:atm) { ATM.new }

  it 'lets user deposit money' do
    atm.deposit(500)
    expect(atm.check_balance).to eq 500
  end
end