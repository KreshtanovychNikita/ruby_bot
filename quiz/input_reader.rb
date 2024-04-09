
require_relative 'libraries'
class InputReader
    def read(welcome_message: nil, validator: nil, error_message: nil, process: nil)
      puts welcome_message if welcome_message
  
      loop do
        input = gets.chomp
  
        if validator.nil? || validator.call(input)
          input = process.call(input) if process
          return input
        else
          puts error_message if error_message
        end
      end
    end
  end
  