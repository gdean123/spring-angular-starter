require 'fileutils'

class Templates
  def self.compile
    nghtml2js = './node_modules/ng-html2js/bin/ng-html2js'
    options = '--module templates --module-var springAngularStarter'

    templates.each do |template|
      system "#{nghtml2js} #{template} #{compiled_template_path(template)} #{options}"
    end
  end

  def self.clean
    FileUtils.rm_rf(output_directory)
  end

  private

  def self.compiled_template_path(template)
    template_basename = File.basename(template, '.*')
    FileUtils::mkdir_p output_directory

    "#{output_directory}/#{template_basename}.js"
  end

  def self.templates
    Dir['src/main/templates/*']
  end

  def self.output_directory
    'src/main/javascript/compiled_templates'
  end
end