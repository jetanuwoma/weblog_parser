RSpec.describe WeblogParser::Aggregator do
  let(:aggregator) { described_class.new(entries) }
  let(:entries) do
    [
      WeblogParser::Entry.new('/index', '127.0.0.1'),
      WeblogParser::Entry.new('/index', '127.0.0.1'),
      WeblogParser::Entry.new('/index', '127.0.0.1'),
      WeblogParser::Entry.new('/index', '127.0.0.1'),
      WeblogParser::Entry.new('/home', '127.0.0.1')
    ]
  end

  describe '#group' do
    subject(:group) { aggregator.group }

    it 'should group all entries by their path' do
      expect(group.keys).to match_array(['/index', '/home'])
    end

    it 'should show total and unique count' do
      expect(group.fetch('/index').total).to eql(4)
      expect(group.fetch('/index').unique).to eql(1)

      expect(group.fetch('/home').total).to eql(1)
      expect(group.fetch('/home').unique).to eql(1)
    end
  end
end
