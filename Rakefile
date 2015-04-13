require 'rubygems'
require 'bundler'

tasks_path = File.join(File.dirname(__FILE__), 'lib', 'tasks', '*_tasks.rb')
Dir[tasks_path].each do |file|
  require file
end

task 'default' do
  Rake::Task[:docs].invoke     if Rake::Task.task_defined?(:docs)
  Rake::Task[:rubocop].invoke  if Rake::Task.task_defined?(:rubocop)
  Rake::Task[:spec].invoke     if Rake::Task.task_defined?(:spec)
end
