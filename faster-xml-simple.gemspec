require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/packagetask'
require 'rake/gempackagetask'


Gem::Specification.new do |s|
  s.name              = 'faster-xml-simple'
  s.version           = Gem::Version.new("0.6.3")
  s.summary           = "A libxml based replacement for XmlSimple"
  s.description       = s.summary
  s.email             = 'dongbin.cn@gmail.com'
  s.author            = 'Michael Koziarski, Dong Bin, Lin Jian'
  s.has_rdoc          = true
  s.extra_rdoc_files  = %w(README COPYING)
  s.homepage          = 'http://github.com/dongbin/faster-xml-simple/tree/master'
  s.files             = FileList['Rakefile', 'lib/**/*.rb']
  s.test_files        = Dir['test/**/*']

  s.rubyforge_project = 'fasterxs'

  s.add_dependency 'libxml-ruby', '>= 0.3.8.4'
  s.rdoc_options  = ['--title', "",
                       '--main',  'README',
                       '--line-numbers', '--inline-source']
end
