require 'singleton'
require_relative 'libraries'

class Quiz
  include Singleton

  attr_accessor :yaml_dir, :in_ext, :answers_dir

  def self.config(&block)
    instance.instance_eval(&block) if block_given?
  end
end
