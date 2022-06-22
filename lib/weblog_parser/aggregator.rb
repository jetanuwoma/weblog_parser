module WeblogParser
  class Aggregator
    def initialize(entries)
      @entries = entries
    end

    def group
      dict = {}
      @entries.each do |entry|
        dict[entry.path] ||= Accumulator.new
        dict[entry.path].add(entry)
      end
      dict
    end

    def self.sort_by_total(data)
      data.sort_by { |_, values| -values.total }
    end

    def self.sort_by_unique(data)
      data.sort_by { |_, values| -values.unique }
    end
  end
end
