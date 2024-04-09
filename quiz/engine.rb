require_relative 'libraries'

class Engine
  attr_accessor :question_collection, :user_name, :statistics

  def initialize(input_reader, writer)
    @input_reader = input_reader
    @writer = writer
    @question_collection = load_question_collection
    @user_name = input_reader.read("Enter your name:").chomp
    @statistics = Hash.new(0)
  end

  def run
    @question_collection.each do |question|
      @writer.puts "Question: #{question}"
      possible_answers = get_possible_answers(question)
      @writer.puts "Possible answers: #{possible_answers.join(', ')}"
      user_answer = get_answer_by_char(question)
      correct_answer = get_correct_answer(question)
      check(user_answer, correct_answer)
    end
    @writer.puts "Statistics: #{@statistics}"
  end

  def check(user_answer, correct_answer)
    if user_answer.downcase == correct_answer.downcase
      @statistics[:correct] += 1
    else
      @statistics[:incorrect] += 1
    end
  end

  def get_answer_by_char(question)
    loop do
      answer = @input_reader.read("Your answer:").chomp.downcase
      return answer unless answer.empty?
    end
  end

  private

  def load_question_collection
    yaml_data = YAML.load_file("questions.yml")
    json_data = JSON.load_file("questions.json")
    yaml_data + json_data
  end

  def get_possible_answers(question)
    # Logic to extract possible answers from question
  end

  def get_correct_answer(question)
    # Logic to extract correct answer from question
  end
end
