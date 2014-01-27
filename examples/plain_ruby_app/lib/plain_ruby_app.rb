libdir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

puts $LOAD_PATH

require 'aspekt'

require 'plain_ruby_app/models/base_model'
require 'plain_ruby_app/models/user'
require 'plain_ruby_app/models/payment'
require 'plain_ruby_app/models/logger'

require 'plain_ruby_app/aspects/payments_logging'
require 'plain_ruby_app/aspects/users_logging'
