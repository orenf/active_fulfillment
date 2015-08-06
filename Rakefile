require 'bundler/gem_tasks'
require 'rake/testtask'

namespace :test do
  Rake::TestTask.new(:units) do |t|
    t.pattern = 'test/unit/**/*_test.rb'
    t.libs << 'test'
    t.verbose = true
  end

  Rake::TestTask.new(:dotcom) do |t|
    t.pattern = 'test/unit/models/dotcom_distribution/**/*_test.rb'
    t.libs << 'test'
    t.verbose = true
  end

  Rake::TestTask.new(:remote) do |t|
    t.pattern = 'test/remote/*_test.rb'
    t.libs << 'test'
    t.verbose = true
  end
end

task :default => 'test:dotcom'
