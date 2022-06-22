# frozen_string_literal: true

module WeblogParser
  # A file reader that readers content from a file
  class FileReader
    def initialize(file_path)
      @file_path = file_path
    end

    def lines
      file.each.map(&:chomp)
    end

    private

    def file
      File.open(@file_path, 'r')
    rescue Errno::ENOENT => e
      raise WeblogParser::Error, e.message
    end
  end
end
