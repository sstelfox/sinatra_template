$LOAD_PATH << File.expand_path(File.join('..', 'app'), __FILE__)
$LOAD_PATH << File.expand_path(File.join('..', 'lib'), __FILE__)

require 'app'

run App::Base
