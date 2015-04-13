def gem_available?(name)
  Gem::Specification.find_all_by_name(name).any?
end

if gem_available?('rspec')
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
end

if gem_available?('rubocop')
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new(:rubocop) do |task|
    task.formatters = %w(simple offenses)
    task.fail_on_error = false
    task.options = %w(--format html --out doc/rubocop.html)
  end
end

if gem_available?('yard')
  require 'yard'
  YARD::Rake::YardocTask.new(:docs)
end
