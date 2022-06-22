RSpec.describe WeblogParser::Accumulator do
  let(:accumulator) { described_class.new }

  describe '#add' do
    subject(:add_entry) { accumulator.add(log_entry) }
    let(:log_entry) { WeblogParser::Entry.new('/index', '127.0.0.1') }

    it 'increments total value when an entry is added' do
      expect { add_entry }.to change { accumulator.total }.by(1)
    end

    it 'increments unique value when a new entry is added' do
      expect { add_entry }.to change { accumulator.unique }.by(1)
    end

    context 'when ip already exists' do
      before do
        accumulator.addresses = ['127.0.0.1']
      end
      it 'does not increment unique value when an existing entry is added' do
        expect { add_entry }.to_not change { accumulator.unique }
      end
    end
  end
end
