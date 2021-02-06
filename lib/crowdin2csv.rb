require "crowdin2csv/version"
require "crowdin2csv/error"
require "crowdin2csv/cli"
require 'nokogiri'
require 'csv'

module Crowdin2csv
  CSV_HEADER = %w(unit_id file_id original source target resname note)

  def crowdin2csv(filename, output_filename)
    CSV.open(output_filename, "w") do |csv|
      csv << CSV_HEADER
      doc = Nokogiri::XML(File.read(filename), nil, 'UTF-8'){ |config| config.strict }

      doc.css("file").each do |file|
        file_id = file.attr("id")
        original = file.attr("original")
        source_lang = file.attr("source-language")
        target_lang = file.attr("target-language")
        datatype = file.attr("datatype")
        file.css("trans-unit").each do |trans_unit|
          trans_unit_id = trans_unit.attr("id")
          resname = trans_unit.attr("resname")
          source = trans_unit.css("source").text
          target = trans_unit.css("target").text
          note = trans_unit.css("note").text

          cols = [trans_unit_id, file_id, original, source, target, resname, note]
          csv << cols
        end
      end
    end
  end
  module_function :crowdin2csv
end
