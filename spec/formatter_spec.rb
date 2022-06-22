RSpec.describe WeblogParser::Formatter do
  let(:formatter) { described_class.new(aggregated_data) }
  let(:path) { File.expand_path('../fixtures/server.log', __FILE__ ) }
  let(:read_data) { WeblogParser::FileReader.new(path) }
  let(:tokenized_data) { WeblogParser::Tokenizer.new(read_data.lines).entries }
  let(:aggregated_data) { WeblogParser::Aggregator.new(tokenized_data).group }

  describe '#format' do
    subject { formatter.format }

    let(:expected_result) do
      <<~RESULT
        Log by total views
        /home 3 visits
        /contact 2 visits
        Log by unique views
        /contact 2 unique views
        /home 1 unique views
      RESULT
    end

    it { is_expected.to eql(expected_result) }
  end
end
