class Javascript
  def self.compile
    options = '--stats --beautify --comments'
    uglifyjs = './node_modules/.bin/uglifyjs'

    system "#{uglifyjs} #{options} -o #{output_file} #{scripts}"
  end

  private

  def self.scripts
    unqualified_dependencies = YAML.load_file('src/main/javascript/javascript.yml')
    qualified_dependencies = unqualified_dependencies.map { |dependency| 'src/main/javascript/' + dependency }
    expanded_dependencies = qualified_dependencies.map { |dependency| Dir[dependency].join(' ') }

    expanded_dependencies.join(' ')
  end

  def self.output_file
    output_directory = 'src/main/webapp/generated'
    FileUtils::mkdir_p output_directory

    "#{output_directory}/application.js"
  end
end