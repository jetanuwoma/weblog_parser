RSpec.describe WeblogParser::FileReader do
  let(:reader) { described_class.new(path) }
  let(:path) { File.expand_path('../fixtures/lines.log', __FILE__ ) }

  describe 'reader' do
    subject(:lines) { reader.lines }
    it { is_expected.to eql(['Juder', 'Peter', 'Akin']) }


    context 'when file does not exists' do
      let(:path) { 'fake.log' }

      it 'should raise an error' do
        expect { reader.lines }.to raise_error(WeblogParser::Error)
      end
    end
  end
end