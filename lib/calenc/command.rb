require 'optparse'
# require 'clipboard'


module Calenc
  class Command
    def self.run
      params = ARGV.getopts('', 'count:7')
      count= params['count'].to_i
      count= 7 unless count > 0
      str= Calenc::Core.new(count).to_s
      # Clipboard.copy(str)
      print str
    end
  end
end
