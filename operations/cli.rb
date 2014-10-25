require 'yaml'
require_relative 'javascript'
require_relative 'templates'
require_relative 'test_server'

class CLI < Thor
  desc 'server', 'run a development server'
  def server
    system './gradlew clean build bootRun'
  end

  desc 'tests', 'run all tests'
  def tests
    # system './node_modules/karma/bin/karma start ./src/test/javascript/config/karma.conf.js'
    test_server.start
    system 'rspec src/test/journeys/*'
    test_server.stop
  end

  desc 'compile_js', 'compile all javascripts and templates into a single file'
  def compile_js
    Templates.compile
    Javascript.compile
    Templates.clean
  end

  private

  def test_server
    @test_server ||= TestServer.new
  end
end