require "httparty"

Dir[File.dirname(__FILE__) + '/connection/*.rb'].each do |file|
  require file
end