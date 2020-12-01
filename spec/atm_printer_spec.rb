require 'atm_printer'

describe ATMPrinter do
  let(:transaction_history) {
    [{
      debit: 500,
      date: '14/01/2012',
      balance: 2500
    },
    {
      credit: 2000,
      date: '13/01/2012',
      balance: 3000
    },
    {
      credit: 1000,
      date: '10/01/2012',
      balance: 1000
    }]}  
  
    describe '#print' do
    it "outputs the transaction history" do
      expect{ ATMPrinter.print(transaction_history) }.to output(
        "date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00\n"
      ).to_stdout
    end
  end
end
