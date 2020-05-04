class HomeController < ApplicationController

    def home

        @current_day = Day.maximum("count")

        record = Day.includes(:daily_records).where(count: (@current_day - 9)..@current_day)

        @recent_satisfaction = record.each_with_object({}) do |day, obj|
            
            obj[day.count] = day.daily_records.reduce(0){|acc, rec| acc + rec.total_satisfaction}

        end

        # determine welcome message

        
    end
end
