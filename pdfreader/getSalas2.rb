require 'net/http'
require 'json'
require 'csv' 

rooms_list = []

("A".."Z").each do |letter|
	3.times do |page|
		uri = URI("http://appmobile.ipt.pt/api/salasapi/#{letter}/#{page}")
		puts "Querying: #{uri}"
		response = Net::HTTP.get(uri)
		data_json = JSON.parse(response)
		rooms_list.concat data_json unless data_json.nil?
	end
end

rooms_list.uniq!

puts "Fetched #{rooms_list.size} rooms."

filename = "ipt_rooms_#{Time.now.strftime('%Y-%m-%d_%H-%M-%S')}.csv"

CSV.open("#{filename}", "w") do |csv|
	csv.to_io.write "\uFEFF" # use CSV#to_io to write BOM directly 
	csv << rooms_list.first.keys
  	rooms_list.each do |room|
  		puts "Saving: #{room["ID"]} - #{room["Nome"]}..."
    csv << room.values
  end
end
puts "Saved #{rooms_list.size} rooms to #{filename}."