require 'simplecov'

SimpleCov.start

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

require_relative '../core/model/minesweeper_model'
require_relative '../core/controller/minesweeper_controller'