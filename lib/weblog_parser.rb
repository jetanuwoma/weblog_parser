# frozen_string_literal: true

require_relative "weblog_parser/version"
require_relative 'weblog_parser/file_reader'
require_relative 'weblog_parser/entry'
require_relative 'weblog_parser/tokenizer'
require_relative 'weblog_parser/accumulator'
require_relative 'weblog_parser/aggregator'
require_relative 'weblog_parser/formatter'
require_relative 'weblog_parser/parser'

module WeblogParser
  class Error < StandardError; end
  # Your code goes here...
end
