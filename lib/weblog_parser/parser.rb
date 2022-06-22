module WeblogParser
  class Parser
    def initialize(file_path)
      @file_path = file_path
    end

    def format
      Formatter.new(aggregated_data).format
    end

    def aggregated_data
      Aggregator.new(tokenized_data).group
    end

    def tokenized_data
      Tokenizer.new(read_data.lines).entries
    end

    def read_data
      FileReader.new(@file_path)
    end
  end
end
