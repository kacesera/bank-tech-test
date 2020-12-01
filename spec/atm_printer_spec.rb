require 'atm_printer'

describe ATMPrinter do
  let(:first_transaction) { double :transaction_1, date: '10/01/2012', balance: 1000, amount: 1000, is_a_deposit?: true, is_a_withdrawal?: false }
  let(:second_transaction) { double :transaction_2, date: '13/01/2012', balance: 3000, amount: 2000, is_a_deposit?: true, is_a_withdrawal?: false }
  let(:third_transaction) { double :transaction_3, date: '14/01/2012', balance: 2500, amount: 500, is_a_deposit?: false, is_a_withdrawal?: true }
  let(:transaction_history) { [third_transaction, second_transaction, first_transaction] }
  
    describe '#print' do
    it "outputs the transaction history" do
      expect{ ATMPrinter.print(transaction_history) }.to output(
        "date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00\n"
      ).to_stdout
    end
  end
end
