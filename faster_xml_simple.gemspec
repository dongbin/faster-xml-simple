  Gem::Specification.new do |s|
    s.name              = 'faster_xml_simple'
    s.version           = Gem::Version.new(FasterXmlSimple::Version)
    s.summary           = "A libxml based replacement for XmlSimple"
    s.description       = s.summary
    s.email             = 'michael@koziarski.com'
    s.author            = 'Michael Koziarski'
    s.has_rdoc          = true
    s.extra_rdoc_files  = %w(README COPYING)
    s.homepage          = 'http://fasterxs.rubyforge.org'
    s.rubyforge_project = 'fasterxs'
    s.files             = FileList['Rakefile', 'lib/**/*.rb']
    s.test_files        = Dir['test/**/*']

    s.add_dependency 'libxml-ruby', '>= 0.3.8.4'
    s.rdoc_options  = ['--title', "",
                       '--main',  'README',
                       '--line-numbers', '--inline-source']
  end
