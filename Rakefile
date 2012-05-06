#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rdoc/task'
require 'fileutils'

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

task :default => :test
Rake::RDocTask.new do |rdoc|
  version = RoleHaml::VERSION

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "role-haml #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

namespace :role do

  desc 'Pull role/master subtree.'
  task :pull do
    system "cd role ; git checkout v#{RoleHaml::VERSION}"
  end

  desc 'Update role assets.'
  task :update => 'role:pull' do
    FileUtils.cp_r('role/lib/.', 'vendor/assets/javascripts')
  end
end
