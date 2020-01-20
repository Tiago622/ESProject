require 'net/http'
require 'json'

require 'csv' 

people_list = []

people_details = []

("a".."z").each do |letter|
	url = URI("http://appmobile.ipt.pt/api/QuemEQuemApi/pesquisa/#{letter}")
	http = Net::HTTP.new(url.host, url.port)
	request = Net::HTTP::Get.new(url)
	request["Authorization"] = 'Basic YXBwQGlwdC5wdDpRR2g4M04yTG8='
	request["Accept"] = 'application/json'
	request["Host"] = 'appmobile.ipt.pt'
	request["Accept-Encoding"] = 'gzip, deflate'
	puts "Querying: #{url}"
	response = http.request(request)
	data_json = JSON.parse(response.read_body)
    people_list.concat data_json["data"] unless data_json["data"].nil?
    #sleep(10) #acho que fui banido
end
people_list.uniq!
puts "Fetched #{people_list.size} people."
urls=[];
people_list.each do |p|
    url = URI("http://appmobile.ipt.pt/api/QuemEQuemApi/pessoa/#{p["id"]}")
    http = Net::HTTP.new(url.host, url.port)
	request = Net::HTTP::Get.new(url)
	request["Authorization"] = 'Basic YXBwQGlwdC5wdDpRR2g4M04yTG8='
	request["Accept"] = 'application/json'
	request["Host"] = 'appmobile.ipt.pt'
    request["Accept-Encoding"] = 'gzip, deflate'
    response = http.request(request)
	data_json = JSON.parse(response.read_body)
    urls.concat data_json["data"] unless data_json["data"].nil?
    puts "Querying: #{url}"
    #sleep(10) #acho que fui banido :|
end
urls.uniq
filename = "ipt_people_#{Time.now.strftime('%Y-%m-%d_%H-%M-%S')}.csv"

CSV.open("#{filename}", "w") do |csv|
	csv.to_io.write "\uFEFF" # use CSV#to_io to write BOM directly 
	csv << urls.first.keys
  	urls.each do |url|
  		puts "Saving: #{url["id"]} - #{url["nome"]}..."
        csv << url.values
    end
end
puts "Saved #{urls.size} rooms to #{filename}."
