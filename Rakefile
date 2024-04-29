# frozen_string_literal: true

require "bundler/gem_tasks"
require "rubocop/rake_task"
require "rspec/core/rake_task"
require "rake/extensiontask"

Rake::ExtensionTask.new("string_toolkit") do |ext|
  ext.lib_dir = "lib/string_toolkit"
  ext.cross_compile = true
  ext.cross_platform = %w[x86-mingw32 x86_64-linux x86_64-darwin]
  ext.config_script = "extconf.rb"
end

desc "Run Rspec code examples"
RSpec::Core::RakeTask.new(:spec)

desc "Run RuboCop on the lib and spec directories"
task :rubocop do
  sh "rubocop"
end

desc "Default task"
task default: %i[compile:string_toolkit spec rubocop]
