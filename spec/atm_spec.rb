require 'atm'

describe ATM do 

  it "starts with a balance of 0" do
    expect(ATM.new.check_balance).to eq 0.00
  end

  describe "#transaction_history" do
    it "returns the transaction history in reverse order" do
      atm = ATM.new
      atm.deposit(1000)
      atm.withdraw(10)
      atm.deposit(5)

      expect(atm.transaction_history[0][:credit]).to eq 5
      expect(atm.transaction_history[1][:debit]).to eq 10
      expect(atm.transaction_history[2][:credit]).to eq 1000
    end
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
      expect(transaction[:credit]).to eq 1000
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

    it "adds the withdrawn amount to transaction history" do
      atm = ATM.new
      atm.deposit(1000, '14/01/2012')
      atm.withdraw(500, '14/01/2012')
      transaction = atm.transaction_history[0]
      expect(transaction[:debit]).to eq 500
    end

    it "adds the date withdrawn to transaction history" do
      atm = ATM.new
      atm.deposit(1000, '14/01/2012')
      atm.withdraw(500, '14/01/2012')
      transaction = atm.transaction_history[0]
      expect(transaction[:date]).to eq '14/01/2012'
    end

    it "adds final balance to transaction history" do
      atm = ATM.new
      atm.deposit(1000, '14/01/2012')
      atm.withdraw(500, '14/01/2012')
      transaction = atm.transaction_history[0]
      expect(transaction[:balance]).to eq 500
    end
  end

  describe '#print_transaction_history' do

    it "outputs the transaction history" do
      atm = ATM.new
      atm.deposit(1000, '10/01/2012')
      atm.deposit(2000, '13/01/2012')
      atm.withdraw(500, '14/01/2012')

      expect{ atm.print_transaction_history }.to output(
        "date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00\n"
      ).to_stdout
    end
  end
end
