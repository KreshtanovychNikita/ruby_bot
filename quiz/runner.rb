require_relative 'libraries'

class ConsoleInputReader
  def read(prompt)
    print prompt + ' '
    gets.chomp
  end
end

class ConsoleOutputWriter
  def puts(message)
    puts message
  end
end

input_reader = ConsoleInputReader.new
output_writer = ConsoleOutputWriter.new

engine = Engine.new(input_reader, output_writer)
engine.run
