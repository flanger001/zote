# frozen_string_literal: true

require_relative "zote/version"

module Zote
  class Error < StandardError; end
  class << self
    def get(line_number = nil)
      line_number = Integer.try_convert(line_number) || rand(1..57)
      precepts = File.open(File.expand_path("data/precepts.txt", __dir__))
      line = nil
      until precepts.lineno == line_number
        line = precepts.readline
      end
      line.chomp
    end
  end
end
