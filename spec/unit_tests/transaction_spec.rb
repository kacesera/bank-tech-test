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

  describe '#amount' do
    it 'returns the amount deposited or withdrawn' do
      expect(@transaction.amount).to eq 1000
    end
  end

  describe '#date' do
    it 'returns the date' do
      today = Date.today.strftime('%d/%m/%Y')
      expect(@transaction.date).to eq today
    end
  end

  describe 'deposit?' do
    context 'transaction is a deposit' do
      it 'returns true' do
        expect(@transaction.deposit?).to be
      end
    end

    context 'transaction is a withdrawal' do
      let(:withdrawal) { Transaction.new('debit', 1000, '10/12/2012', 1000) }
      it 'returns false' do
        expect(withdrawal.deposit?).to be false
      end
    end
  end

  describe 'withdrawal?' do
    context 'transaction is a deposit' do
      it 'returns false' do
        expect(@transaction.withdrawal?).to be false
      end
    end

    context 'transaction is a withdrawal' do
      let(:withdrawal) { Transaction.new('debit', 1000, '10/12/2012', 1000) }
      it 'returns false' do
        expect(withdrawal.withdrawal?).to be
      end
    end
  end
end
