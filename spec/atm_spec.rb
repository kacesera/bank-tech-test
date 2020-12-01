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

    it "adds the deposited amount to transaction history" do
      atm = ATM.new
      atm.deposit(1000)
      transaction = atm.transaction_history[0]
      expect(transaction[:amount]).to eq 1000
    end

    it "adds the date deposited to transaction history" do
      atm = ATM.new
      atm.deposit(1000, '14/01/2012')
      transaction = atm.transaction_history[0]
      expect(transaction[:date]).to eq '14/01/2012'
    end

    it "adds final balance to transaction history" do
      atm = ATM.new
      atm.deposit(1000, '14/01/2012')
      transaction = atm.transaction_history[0]
      expect(transaction[:balance]).to eq 1000
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
