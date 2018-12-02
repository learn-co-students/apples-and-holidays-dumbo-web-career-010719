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
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas].push(supply)
  holiday_hash[:winter][:new_years].push(supply)
end

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day].push(supply)
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks., BBQ
  # etc.\
  retStr = ""
  holiday_hash.each do |season_key, season_value|
    puts "#{cap_helper(season_key.to_s)}:"
    season_value.each do |holiday_key, holiday_value|
      holidayStr = ""
      holiday_value.each do |value|
        holidayStr += (value == holiday_value[-1] ? " #{cap_helper(value)}" : " #{cap_helper(value)},")
      end
      puts "  #{cap_helper(holiday_key.to_s)}:" + holidayStr
    end
  end
end


def cap_helper(string)
  stringArray = string.include?("_") ? string.split("_") : string.split
  stringArray.each do |word|
    if word != word.upcase #leave all caps as is i.e - BBQ
      word.capitalize!
    end 
  end
  stringArray.join(" ")
end

  

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  rarr = []
  holiday_hash.each do |season_key, season_value|
    season_value.each do |holiday_key, holiday_value|
      holiday_value.each do |value|
        if value == "BBQ"; rarr << holiday_key; end
      end
    end
  end
  rarr
end







