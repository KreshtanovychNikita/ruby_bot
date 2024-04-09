# config.rb
require_relative 'libraries'
require_relative 'quiz'

Quiz.config do
  self.yaml_dir = "quiz/yml"
  self.answers_dir = "quiz/answers"
  self.in_ext = "yml"
end
