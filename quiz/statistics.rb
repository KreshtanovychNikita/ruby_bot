
require_relative 'libraries'
class Statistics
    def initialize(writer)
      @correct_answers = 0
      @incorrect_answers = 0
      @writer = writer
    end
  
    def correct_answer
      @correct_answers += 1
    end
  
    def incorrect_answer
      @incorrect_answers += 1
    end
  
    def print_report(total_questions)
      total_attempts = @correct_answers + @incorrect_answers
      correct_percentage = (total_attempts > 0) ? (@correct_answers.to_f / total_attempts * 100).round(2) : 0
  
      report = "Total questions: #{total_questions}\n"
      report += "Correct answers: #{@correct_answers}\n"
      report += "Incorrect answers: #{@incorrect_answers}\n"
      report += "Correct percentage: #{correct_percentage}%\n"
  
      @writer.write(report)
    end
  end
  