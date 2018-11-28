require 'date'

module Calenc
  class Core
    def initialize(count=7)
      @count= count
      @start_date= Date.today
    end

    WeekdayJp= "日月火水木金土".split('')
    def to_s
      str= ''
      @count.times do |i|
        date= @start_date+ i
        s= date.strftime('%02m/%02d')
        s << "(%s)\n" % WeekdayJp[date.wday]
        str << s
      end
      str
    end
  end
end
