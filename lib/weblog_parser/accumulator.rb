module WeblogParser
  class Accumulator
    attr_accessor :total, :unique, :addresses

    def initialize
      @total = 0
      @unique = 0
      @addresses = []
    end

    def add(entry)
      self.total += 1
      self.unique += 1 unless addresses.include?(entry.ip)
      addresses << entry.ip unless addresses.include?(entry.ip)
    end
  end
end


