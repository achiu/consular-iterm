require 'rubygems'
gem 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'mocha'
require 'mocha/setup'
require File.expand_path('../../lib/consular/iterm', __FILE__)


class ColoredIO
  ESC = "\e["
  NND = "#{ESC}0m"

  def initialize(io)
    @io = io
  end

  def print(o)
    case o
    when "."
      @io.send(:print, "#{ESC}32m#{o}#{NND}")
    when "E"
      @io.send(:print, "#{ESC}33m#{o}#{NND}")
    when "F"
      @io.send(:print, "#{ESC}31m#{o}#{NND}")
    else
      @io.send(:print, o)
    end
  end

  def puts(*o)
    super
  end
end

Minitest::Reporters.use! [
  Minitest::Reporters::DefaultReporter.new(color: true)
]
