require_relative 'libraries'

class Question
  attr_accessor :question_body, :question_correct_answer, :question_answers

  def initialize(raw_text, raw_answers)
    @question_body = raw_text
    @question_answers = load_answers(raw_answers)
    @question_correct_answer = @question_answers.values.find { |answer| answer[:correct] }
  end

  def display_answers
    @question_answers.map { |char, answer| "#{char}. #{answer[:text]}" }
  end

  def to_s
    "#{@question_body}\n#{display_answers.join("\n")}"
  end

  def to_h
    {
      question_body: @question_body,
      question_correct_answer: @question_correct_answer[:text],
      question_answers: @question_answers.transform_values { |answer| answer[:text] }
    }
  end

  def to_json
    to_h.to_json
  end

  def to_yaml
    to_h.to_yaml
  end

  def load_answers(raw_answers)
    answers = raw_answers.split(',').map(&:strip).shuffle
    answers_hash = {}

    ('A'..'Z').each_with_index do |char, index|
      answers_hash[char] = { text: answers[index], correct: false }
    end

    correct_char = ('A'..'Z').to_a.sample
    answers_hash[correct_char][:correct] = true

    answers_hash
  end

  def find_answer_by_char(char)
    @question_answers[char][:text]
  end
end

=begin # Приклад використання класу
raw_text = "What is the capital of France?"
raw_answers = "Berlin, Paris, Madrid, Rome"

question = Question.new(raw_text, raw_answers)
puts question.to_s

puts "\nCorrect Answer: #{question.question_correct_answer}"
puts "\nAnswers Hash:"
puts question.to_h
puts "\nJSON Format:"
puts question.to_json
puts "\nYAML Format:"
puts question.to_yaml
puts "\nAnswer for 'A': #{question.find_answer_by_char('A')}"
=end