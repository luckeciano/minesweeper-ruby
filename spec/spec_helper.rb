require 'simplecov'

SimpleCov.start

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

require_relative '../core/model/minesweeper_model'