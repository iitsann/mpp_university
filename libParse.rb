require 'nokogiri'
require 'open-uri'
require 'csv'

# Function to parse the Wikipedia page and extract library information
def parse_wikipedia_page(url)
  doc = Nokogiri::HTML(URI.open(url))
  libraries = []

  doc.css('div.mw-parser-output ul li').each do |library|
    # Extracting ID and name from the list items
    id, name = library.text.strip.split(' ', 2)
    libraries << { 'id' => id, 'name' => name }
  end

  libraries
end

# Function to write library information to a CSV file
def write_to_csv(libraries, csv_filename)
  CSV.open(csv_filename, 'w', headers: %w[id name], write_headers: true) do |csv|
    libraries.each { |library| csv << [library['id'], library['name']] }
  end
end

# Wikipedia page URL
wikipedia_url = 'https://en.wikipedia.org/wiki/List_of_libraries'

# Parse the Wikipedia page
libraries = parse_wikipedia_page(wikipedia_url)

# Specify the CSV filename
csv_filename = 'libraries.csv'

# Write library information to the CSV file
write_to_csv(libraries, csv_filename)

puts "CSV file '#{csv_filename}' has been created with library ID and name."