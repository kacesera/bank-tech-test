require 'transaction'

describe Transaction do
  before(:each) do
    @transaction = Transaction.new('credit', 1000, 1000)
  end

  describe '#balance' do
    it 'returns the balance' do
      expect(@transaction.balance).to eq 1000
    end
  end

  describe '#date' do
  it 'returns the date' do
    today = Date.today.strftime('%d/%m/%Y')
    expect(@transaction.date).to eq today
  end
end

  describe 'is_a_deposit?' do
    context 'transaction is a deposit' do
      it 'returns true' do
        expect(@transaction.is_a_deposit?).to be
      end
    end

    context 'transaction is a withdrawal' do
      let(:withdrawal) { Transaction.new('debit', 1000, '10/12/2012', 1000)}
      it 'returns false' do
        expect(withdrawal.is_a_deposit?).to be false
      end
    end
  end

  describe 'is_a_withdrawal?' do
    context 'transaction is a deposit' do
      it 'returns false' do
        expect(@transaction.is_a_withdrawal?).to be false
      end
    end

    context 'transaction is a withdrawal' do
      let(:withdrawal) { Transaction.new('debit', 1000, '10/12/2012', 1000)}
      it 'returns false' do
        expect(withdrawal.is_a_withdrawal?).to be
      end
    end
  end

end
