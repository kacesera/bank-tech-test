require 'atm'

describe ATM do 
  let(:transaction) { double :transaction }
  let(:transaction_class) { double :transaction_class, new: transaction }

  it "starts with a balance of 0" do
    expect(ATM.new.check_balance).to eq 0.00
  end

  describe "#deposit" do
    before(:each) do
      allow(transaction).to receive(:amount) { 1000 }
      allow(transaction).to receive(:date) { '14/01/2012' }
      allow(transaction).to receive(:balance) { 1000 }

      @atm = ATM.new(transaction_class)
      @atm.deposit(1000)
      @transaction = @atm.transaction_history[0]
    end

    it "adds money to the balance" do
      expect(@atm.check_balance).to eq 1000
    end

    it "adds the deposited amount to transaction history" do
      expect(@transaction.amount).to eq 1000
    end

    it "adds the date deposited to transaction history" do
      expect(@transaction.date).to eq '14/01/2012'
    end

    it "adds final balance to transaction history" do
      expect(@transaction.balance).to eq 1000
    end
  end

  describe "#withdraw" do
    before(:each) do
      allow(transaction).to receive(:amount) { 500 }
      allow(transaction).to receive(:date) { '14/01/2012' }
      allow(transaction).to receive(:balance) { 500 }

      @atm = ATM.new(transaction_class)
      @atm.deposit(1000)
      @atm.withdraw(500)
      @transaction = @atm.transaction_history[0]
    end
    it "subtracts money to the balance" do
      expect(@atm.check_balance).to eq 500
    end

    it "adds the withdrawn amount to transaction history" do
      expect(@transaction.amount).to eq 500
    end

    it "adds the date withdrawn to transaction history" do
      expect(@transaction.date).to eq '14/01/2012'
    end

    it "adds final balance to transaction history" do
      expect(@transaction.balance).to eq 500
    end
  end

  describe '#print_transaction_history' do
    let(:atm_printer) { double :ATMPrinter_class, print: true }

    it "outputs the transaction history" do
      atm = ATM.new(transaction_class, atm_printer)
      expect(atm_printer).to receive(:print)
      atm.print_transaction_history
    end
  end
end
