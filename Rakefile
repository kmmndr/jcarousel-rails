#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end
begin
  require 'rdoc/task'
rescue LoadError
  require 'rdoc/rdoc'
  require 'rake/rdoctask'
  RDoc::Task = Rake::RDocTask
end
require "fileutils"

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'JcarouselRails'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end




Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end



desc "Update included JCarousel sources"
task :update_from_source do |t|
  current_directory = File.expand_path File.dirname(__FILE__)
  source_directory  = File.join current_directory, 'jcarousel'
  assets_directory  = File.join current_directory, 'vendor', 'assets'
  docs_directory    = File.join current_directory, 'doc'

  puts "Updating sources..."

  `git submodule update`

  puts "Trashing the old stuff..."

  FileUtils.rm_r Dir.glob(File.join assets_directory, 'javascripts', '*')

  puts "Copying over other files..."

  {
    "dist/jquery.jcarousel*.js"  => File.join(assets_directory, "javascripts"),
    "licenses/*"                  => File.join(docs_directory, "licenses")
  }.each do |source, destination|
    FileUtils.mkdir_p destination
    FileUtils.cp_r Dir.glob(File.join source_directory, source), destination
  end

  puts "Done! Now update version information and release!"
end


task :default => :test
