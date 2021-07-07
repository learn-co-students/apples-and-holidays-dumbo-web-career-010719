require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  
  
  holiday_hash.keys.each do |season|
    holiday_hash[season].keys.each do |holiday|
      if holiday === :fourth_of_july
        return holiday_hash[season][holiday][1]
      end
    end
  end
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  
  holiday_hash.keys.each do |season|
    if season === :winter
      holiday_hash[season].keys.each do |holiday|
        holiday_hash[season][holiday].push(supply)
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  
  holiday_hash.keys.each do |season|
    if season === :spring
      holiday_hash[season].keys.each do |holiday|
        if holiday === :memorial_day
          holiday_hash[season][holiday].push(supply)
        end      
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  
    winter_supplies = []
    holiday_hash[:winter].keys.each do |holiday|
      holiday_hash[:winter][holiday].each do |supply|
        winter_supplies << supply
      end
    end
    winter_supplies
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  
  holiday_hash.keys.each do |season|
    puts "#{season.to_s.capitalize}:"
    holiday_hash[season].keys.each do |holiday|
      supply_string = holiday_hash[season][holiday].join(", ")
      if holiday.to_s.include?("_")
        arr = holiday.to_s.split("_")
        arr.each {|word| word.capitalize!}
        holiday_string = arr.join(" ")
      else
        holiday_string = holiday.to_s.capitalize
      end
      puts "  #{holiday_string}: #{supply_string}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  
    holiday_symbols = []
    
    holiday_hash.keys.each do |season|
      holiday_hash[season].keys.each do |holiday|
        if holiday_hash[season][holiday].include?("BBQ")
          holiday_symbols << holiday
        end
      end
    end
    holiday_symbols
end