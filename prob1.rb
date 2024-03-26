require 'httparty'
require 'json'

# Replace 'username' with the actual GitHub username you're interested in
username = 'alan786'

# Make the GET request to the GitHub API
response = HTTParty.get("https://api.github.com/users/#{username}/repos")

# Parse the JSON response
repositories = JSON.parse(response.body)

# Ensure the response contains an array of repositories
unless repositories.is_a?(Array)
  puts "Error fetching repositories. Make sure the username is correct."
  exit
end

# Find the repository with the highest star count
most_starred = repositories.max_by { |repo| repo['stargazers_count'] }

if most_starred
  # Display information about the most starred repository
  puts "Most Starred Repository:"
  puts "Name: #{most_starred['name']}"
  puts "Description: #{most_starred['description']}"
  puts "Stars: #{most_starred['stargazers_count']}"
  puts "URL: #{most_starred['html_url']}"
else
  puts "No repositories found for user: #{username}"
end

