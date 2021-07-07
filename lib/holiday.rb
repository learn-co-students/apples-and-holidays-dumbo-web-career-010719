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
  # iterates through winter holidays adds a supply to each one
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  # modifies the original hash by adding supplies of a new holiday to a season
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end
# iterate through holiday_hash and print items such that your readout resembles:
# Winter:
#   Christmas: Lights, Wreath
#   New Years: Party Hats
# Summer:
#   Fourth Of July: Fireworks, BBQ
# etc.
def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, data|
    puts "#{season.capitalize}:"

    data.each do |holiday, supply|
      new_string = holiday.to_s
      arr = new_string.split("_")
      new_arr = arr.collect {|word| word[0].upcase + word[1..-1]}
      capital_string = new_arr.join(" ")

      supplies = supply.join(", ")
      supplies.capitalize
      puts "  #{capital_string}: #{supplies}"
    end
  end
end

# return an array of holiday names (as symbols) where supply lists
# include the string "BBQ"
# should return :fourth_of_july and :memorial_day
def all_holidays_with_bbq(holiday_hash)
  bbq = []
  holiday_hash.each do |season, data|
    data.each do |holiday, supplies|
      supplies.each do |supply|
        if supply == "BBQ"
          bbq << holiday
        end
      end
    end
  end
  return bbq
end
