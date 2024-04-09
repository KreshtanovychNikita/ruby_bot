require_relative 'libraries'


class QuestionData
  attr_reader :collection, :yaml_dir, :in_ext

  def initialize(yaml_dir, in_ext)
    @collection = []
    @yaml_dir = yaml_dir
    @in_ext = in_ext
    @threads = []
    load_data
  end

  def to_yaml
    @collection.to_yaml
  end

  def save_to_yaml(filename)
    File.open(filename, 'w') { |file| file.write(to_yaml) }
  end

  def to_json
    @collection.to_json
  end

  def save_to_json(filename)
    File.open(filename, 'w') { |file| file.write(to_json) }
  end

  def prepare_filename(filename)
    File.expand_path(filename, __dir__)
  end

  def each_file(&block)
    Dir.glob(File.join(@yaml_dir, "*#{@in_ext}")).each(&block)
  end

  def in_thread(&block)
    @threads << Thread.new(&block)
  end

  def load_data
    each_file do |filename|
      in_thread { load_from(filename) }
    end
    @threads.each(&:join)
  end

  def load_from(filename)
    data = YAML.load_file(filename)
    # assuming data is an array of hashes where each hash represents a question
    data.each do |question_data|
      question = Question.new(question_data)
      question.shuffle_answers # assuming shuffle_answers is a method in the Question class
      @collection << question
    end
  end
end
