require 'yaml'
require_relative 'javascript'
require_relative 'templates'

class CLI < Thor
  desc 'server', 'run a development server'
  def server
    system './gradlew clean build bootRun'
  end

  desc 'tests', 'run all tests'
  def tests
    system 'rspec src/test/journeys/*'
  end

  desc 'compile_js', 'compile all javascripts and templates into a single file'
  def compile_js
    Templates.compile
    Javascript.compile
    Templates.clean
  end
end