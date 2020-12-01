require 'atm'

describe ATM do 

  describe "#deposit" do
    it "adds money to the balance" do
      atm = ATM.new
      atm.deposit(1000)
      expect(atm.check_balance).to eq 1000
    end
  end
end
