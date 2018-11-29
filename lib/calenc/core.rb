require 'date'

module Calenc
  class Core
    def initialize(count=7, date= Date.today, interactive=false)
      @count= count

      case date
      when Date
        @start_date= date
      when String
        @start_date= Date.parse(date)
      end

      @complete= !interactive
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

    def complete?
      @complete
    end

    def output
      'This is interactive mode. Input something: '
    end

    def input(str)
      @complete= true
    end
  end
end
