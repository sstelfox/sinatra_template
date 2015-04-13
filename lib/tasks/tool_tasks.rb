task 'environment' do
  $LOAD_PATH << File.expand_path(File.join('..', 'app'), __FILE__)
  $LOAD_PATH << File.expand_path(File.join('..', 'lib'), __FILE__)

  require 'app'
end

desc 'Run a console with the application code loaded.'
task 'console' => ['environment'] do
  require 'pry'
  pry
end
