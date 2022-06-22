module WeblogParser
  class Formatter
    def initialize(aggregated_data)
      @data = aggregated_data
    end

    def format
      <<~LINES
        Log by total views
        #{total_views}
        Log by unique views
        #{unique_views}
      LINES
    end

    private

    def total_views
      Aggregator.sort_by_total(@data).map do |path, acc|
        "#{path} #{acc.total} visits"
      end.join('\n')
    end

    def unique_views
      Aggregator.sort_by_unique(@data).map do |path, acc|
        "#{path} #{acc.unique} unique views"
      end.join('\n')
    end
  end
end