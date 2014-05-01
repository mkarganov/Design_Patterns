# Dynamic Alternatives to the Decorator pattern

w = SimpleWriter.new('out')

class << w
  alias old_write_line write_line

  def write_line(line)
    old_write_line("#{Time.new}: #{line}")
  end
end

# w = SimpleWriter.new('out')
# After extending instance, module methods available only to this single instance
# w.extend(TimeStampingWriter)
# w.extend(NumberingWriter)

module TimeStampingWriter
  def write_line(line)
    super("#{Time.new}: #{line}")
  end
end

module NumberingWriter
  attr_reader :line_number

  def write_line(line)
    @line_number ||= 1
    super("#{@line_number}: #{line}")
    @line_number += 1
  end
end
