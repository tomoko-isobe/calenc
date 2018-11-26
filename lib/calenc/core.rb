require 'date'
require 'clipboard'

module Calenc
  class Core
    def initialize(count)
      @count= count.to_i
      @start_date= Date.today
    end

    WeekdayJp= "日月火水木金土".split('')
    def clip
      str= ''
      @count.times do |i|
        date= @start_date+ i
        s= date.strftime('%02m/%02d')
        s << "(%s)\n" % WeekdayJp[date.wday]
        str << s
      end
      Clipboard.copy(str)
    end
  end
end
