require 'pry-byebug'

def stock_picker(prices)
  buy_price = prices[0]
  sell_price = prices[1]
  buy_day = 0
  sell_day = 1
  profit = sell_price - buy_price
 
  prices.each_with_index do |bprice, bday|
    sell_array = prices.drop(bday+1)
      if sell_array != [] && (sell_array.max - bprice) > profit
        profit = (sell_array.max - bprice)
        buy_price = bprice
        sell_price = sell_array.max
        buy_day = bday
        sell_day = prices.rindex(sell_price)
      end
    end
  puts "[#{buy_day},#{sell_day}] for a profit of $#{sell_price} - #{buy_price} = #{profit}"
end

prices = [2,5,6,8,2,1,5,7,8,9,56,2,1,3,4,5]

stock_picker(prices)