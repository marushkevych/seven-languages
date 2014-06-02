class CsvRow
  def initialize(cols, data)
    @cols = cols
    @data = data
  end

  def method_missing(m, *args)
    index = @cols.find_index m.to_s
    index && @data.at(index)
  end
end


module ActsAsCsv
  def each
    @csv_contents.each{|row| yield CsvRow.new(@headers, row)}
  end

  def read
    @csv_contents = []
    filename = self.class.to_s.downcase + '.txt'
    file = File.new(filename)
    @headers = file.gets.chomp.split(', ')

    file.each do |row|
      @csv_contents << row.chomp.split(', ')
    end
  end

  attr_accessor :headers, :csv_contents
  def initialize
    read
  end
end

class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv, Enumerable
end

csv = RubyCsv.new
puts csv.headers.inspect
puts csv.csv_contents.inspect

csv.each{|row| p row.col_three}
