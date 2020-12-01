require 'atm'

describe ATM do 

  it "starts with a balance of 0" do
    expect(ATM.new.check_balance).to eq 0
  end

  describe "#deposit" do
    it "adds money to the balance" do
      atm = ATM.new
      atm.deposit(1000)
      expect(atm.check_balance).to eq 1000
    end
  end

  describe "#withdraw" do
    it "subtracts money to the balance" do
      atm = ATM.new
      atm.deposit(1000)
      atm.withdraw(500)
      expect(atm.check_balance).to eq 500
    end
  end
end
