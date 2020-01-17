# encoding: utf-8
Dir.chdir(File.dirname(__FILE__))

require './xfile.rb'

if ARGV[0] != nil
    puts JSON.pretty_generate(Xfile.new(ARGV[0]).get_info)
end
