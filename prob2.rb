require 'httparty'
require 'json'

# Define the URL for CoinGecko API to fetch market data in USD
url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"

# Send a GET request to the CoinGecko API
response = HTTParty.get(url)

# Parse the JSON response
cryptocurrencies = JSON.parse(response.body)

# Ensure the response is an array of cryptocurrencies
unless cryptocurrencies.is_a?(Array)
  puts "Error fetching cryptocurrency data."
  exit
end

# Sort cryptocurrencies by market capitalization in descending order
sorted_cryptos = cryptocurrencies.sort_by { |crypto| -crypto['market_cap'] }

# Output the names and current prices of the top 5 cryptocurrencies by market cap
puts "Top 5 Cryptocurrencies by Market Capitalization:"
sorted_cryptos.first(5).each_with_index do |crypto, index|
  puts "#{index + 1}. #{crypto['name']} - Price: $#{crypto['current_price']} - Market Cap: $#{crypto['market_cap']}"
end
