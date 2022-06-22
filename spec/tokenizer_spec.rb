RSpec.describe WeblogParser::Tokenizer do
  let(:tokenizer) { described_class.new(lines) }
  let(:lines) do
    [
      '/help_page/1 929.398.951.889',
      '/contact 555.576.836.194',
      '/about/2 184.123.665.067'
    ]
  end

  describe '#entries' do
    subject { tokenizer.entries }

    it {
      is_expected.to eql([
                           WeblogParser::Entry.new('/help_page/1', '929.398.951.889'),
                           WeblogParser::Entry.new('/contact', '555.576.836.194'),
                           WeblogParser::Entry.new('/about/2', '184.123.665.067')
                         ])
    }
  end
end
