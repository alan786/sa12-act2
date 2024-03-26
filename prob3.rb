require 'httparty'
require 'json'

# Define the area and location for which to fetch the time
area = "Europe"
location = "London"

# Construct the URL for the GET request
url = "http://worldtimeapi.org/api/timezone/#{area}/#{location}"

# Send the GET request to the WorldTimeAPI
response = HTTParty.get(url)

# Parse the JSON response
time_data = JSON.parse(response.body)

# Check for a successful response
if response.code == 200 && time_data['datetime']
  # Extract the current date and time
  datetime = Time.parse(time_data['datetime'])

  # Output the current time in the specified timezone
  puts "The current time in #{area}/#{location} is #{datetime.strftime('%Y-%m-%d %H:%M:%S')}"
else
  puts "Failed to retrieve time data for the specified location."
end
