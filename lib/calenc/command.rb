require 'optparse'

module Calenc
  class Command
    def self.run
      params = ARGV.getopts('', 'count:7')
      Calenc::Core.new(params['count']).clip
    end
  end
end
