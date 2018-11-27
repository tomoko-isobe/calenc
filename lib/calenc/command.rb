require 'optparse'

module Calenc
  class Command
    def self.run
      params = ARGV.getopts('', 'count:7')
      count= params['count']
      str= Calenc::Core.new(count).to_s
      Clipboard.copy(str)
    end
  end
end
