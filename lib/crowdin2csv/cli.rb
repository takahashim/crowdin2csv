require "optparse"

module Crowdin2csv
  class CLI

    def self.execute(args)
      new.execute(args)
    end

    def initialize
      @output_filename = nil
    end

    def execute(args)
      opts = OptionParser.new do |opts|
        opts.banner = "Usage: crowdin2csv [options] <xliff filename>"
        opts.program_name = "crowdin2csv"

        opts.on("-o", "--output-file FILENAME", "output csv filename") do |filename|
          @output_filename = filename
        end
      end

      opts.parse!(args)

      if args.size != 1
        raise Crowdin2csv::Error, "xliff file not found."
      end

      filename = args[0]

      if !File.file?(filename)
        raise Crowdin2csv::Error, "xliff file is invalid."
      end

      output_filename = @output_filename || File.basename(filename, ".xliff") + ".csv"

      Crowdin2csv.crowdin2csv(filename, output_filename)
    rescue Crowdin2csv::Error => e
      $stderr.puts e.message
      $stderr.puts opts.help
      exit 1
    end
  end
end
