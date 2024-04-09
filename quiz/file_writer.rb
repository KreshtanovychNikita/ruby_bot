require_relative 'libraries'
class FileWriter
    def initialize(mode, *args)
      @answers_dir = args[0] || 'default_directory'
      @filename = args[1] || 'default_filename.txt'
      @mode = mode
    end
  
    def write(message)
      File.open(prepare_filename(@filename), @mode) do |file|
        file.puts(message)
      end
    end
  
    def prepare_filename(filename)
      File.join(@answers_dir, filename)
    end
  end
  