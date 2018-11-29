require 'optparse'
# require 'clipboard'


module Calenc
  class Command
    def self.run
      params = ARGV.getopts('', 'count:7', 'interactive')

      count= params['count'].to_i
      count= 7 unless count > 0

      interactive= params['interactive']

      calenc= Calenc::Core.new(count, Date.today, interactive)
      until calenc.complete? do
        puts calenc.output
        calenc.input(gets)
      end

      str= calenc.to_s
      print str
    end
  end
end
