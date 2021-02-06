# frozen_string_literal: true

require 'optparse'

module Crowdin2csv
  class CLI
    def self.execute(args)
      new.execute(args)
    end

    def initialize
      @output_filename = nil
    end

    def execute(args)
      opts = option_parser

      opts.parse!(args)

      raise Crowdin2csv::Error, 'xliff file not found.' if args.size != 1

      filename = args[0]
      raise Crowdin2csv::Error, 'xliff file is invalid.' unless File.file?(filename)

      output_filename = @output_filename || "#{File.basename(filename, '.xliff')}.csv"
      Crowdin2csv.crowdin2csv(filename, output_filename)
    rescue Crowdin2csv::Error => e
      warn e.message, opts.help
      exit 1
    end

    private

    def option_parser
      OptionParser.new do |opt|
        opt.banner = 'Usage: crowdin2csv [options] <xliff filename>'
        opt.program_name = 'crowdin2csv'

        opt.on('-o', '--output-file FILENAME', 'output csv filename') do |filename|
          @output_filename = filename
        end
      end
    end
  end
end
