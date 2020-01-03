require 'csv'
ficheiro = File.read("pessoas.csv")

table = CSV.parse(ficheiro, headers: true)

table.each do |linha|
    Person.create({:name=>linha['nome']})
    puts "#{linha['nome']} : #{linha['email']}"
end
