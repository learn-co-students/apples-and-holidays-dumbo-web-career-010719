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
    # 1. returns the string 'BBQ' without hardcoding it
    holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
    # add the second argument, which is a supply, to BOTH the
    # Christmas AND the New Year's arrays
    # 1. iterates through winter holidays
    # 2. adds a supply to each one
    holiday_hash[:winter].each do |holiday, value|
        value << supply
    end
end


def add_supply_to_memorial_day(holiday_hash, supply)
    # add the second argument to the memorial day array
    # 1. adds a supply to memorial day
    # 2. adds a different supply to memorial day
    holiday_hash[:spring][:memorial_day].push(supply)
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
    # remember to return the updated hash
    # 1. modifies the original hash by adding supplies
    #    of a new holiday to a season
    holiday_hash[season][holiday_name]= supply_array
    holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
    # return an array of all supplies used in the winter season
    holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
    # iterate through holiday_hash and print items
    # such that your readout resembles:

    # Winter:
    #   Christmas: Lights, Wreath
    #   New Years: Party Hats
    # Summer:
    #   Fourth Of July: Fireworks, BBQ
    # etc.

    # 1. output the formatted list of holidays and their supplies
    holiday_hash.each do |season,holiday|
        puts "#{season.to_s.capitalize}:"

        holiday.each do |holiday_name, supply|
            puts "  #{holiday_name.to_s.split("_").each{|x| x.capitalize!}.join(" ")}: #{supply.join(", ")}"
        end
    end
end

def all_holidays_with_bbq(holiday_hash)
    # return an array of holiday names (as symbols) where supply lists
    # include the string "BBQ"
    # 1. return :fourth_of_july and :memorial_day
    bbqs = []
    holiday_hash.each do |season, holiday|

        holiday.each do |holiday_name, supply|
            bbqs << holiday_name if supply.include?("BBQ")
        end
    end
    bbqs
end
