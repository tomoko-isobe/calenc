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

      if interactive
        @responses= 0
      else
        @responses= Float::INFINITY
      end

      @messages=[
        "Start date: ",
        "Count of days: ",
      ]
      @do=[
        :set_start_date,
        :set_days_count,
      ]
    end
    attr_reader :count

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
      @messages.size <= @responses
    end

    def output
      @messages[@responses]
    end

    def input(str)
      send(@do[@responses], str)
      @responses+=1
    end

    def set_start_date(str)
      case str
      when Date
        @start_date= str
      when String
        @start_date= Date.parse(str)
      end
    end

    def set_days_count(str)
      count= str.to_i
      @count= count if count > 0
    end
  end
end
