Gem::Specification.new do |s|
  s.name              = 'faster-xml-simple'
  s.version           = "0.6.4"
  s.summary           = "A libxml based replacement for XmlSimple"
  s.description       = s.summary
  s.email             = 'dongbin.cn@gmail.com'
  s.authors            = ['Michael Koziarski, Dong Bin, Lin Jian']
  s.has_rdoc          = true
  s.extra_rdoc_files  = %w(README COPYING)
  s.homepage          = 'http://github.com/dongbin/faster-xml-simple/tree/master'
  s.files             = ['COPYING', 'faster-xml-simple.gemspec', 'Rakefile', 'README', 'lib/faster_xml_simple.rb']
  s.test_files        = Dir['test/**/*']

  s.add_dependency 'libxml-ruby', '>= 0.3.8.4'
  s.rdoc_options  = ['--title', "",
                       '--main',  'README',
                       '--line-numbers', '--inline-source']
end
