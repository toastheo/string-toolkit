# frozen_string_literal: true

require "bundler/gem_tasks"
require "rubocop/rake_task"
require "rspec/core/rake_task"

namespace :ext do
  desc "Prepare and build the C++ extension"
  task :build do
    sh "ruby ext/string_toolkit/extconf.rb"
    sh "make"
    sh "mv string_toolkit.o string_toolkit.so lib/string_toolkit"
  end
end

desc "Run Rspec code examples"
RSpec::Core::RakeTask.new(:spec)

desc "Run RuboCop on the lib and spec directories"
task :rubocop do
  sh "rubocop"
end

desc "Default task"
task default: ["ext:build", :spec, :rubocop]
