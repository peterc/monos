module Monos
  class Queue
    def initialize
      @queue = {}
      @start_time = Time.now.to_i
      @ran_last = Time.now.to_i
    end
    
    def add(time_from_now = 1, &blk)
      tn = Time.now.to_i
      @queue[tn + time_from_now] ||= []
      @queue[tn + time_from_now] << blk
    end
    
    def run      
      tn = Time.now.to_i

      return if @ran_last == tn
      @ran_last = tn
      
      if @queue[tn]
        @queue[tn].each do |blk|
          blk.call
        end
        @queue.delete(tn)
      end
      
      if interval_timers = @queue.keys.select { |k| k < 1024 }
        interval_timers.each do |sec|
          if @queue[sec] && (tn - @start_time) % sec == 0
            @queue[sec].each do |blk|
              blk.call
            end
          end
        end
      end
    end
    
    def every(sec = 1, &blk)
      @queue[sec] ||= []
      @queue[sec] << blk
    end
  end
end