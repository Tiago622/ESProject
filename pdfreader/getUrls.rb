require 'open-uri'
require 'nokogiri'

file = File.open("urls.txt", "w");

file.close unless file.nil?
lista_de_sources=["#licenciaturas","#mestrados","#tesp"]

base_url = "http://portal2.ipt.pt"
text =""

lista_de_sources.each do |tipo|
    
    file = File.open("urls.txt", "a");
    url = "http://portal2.ipt.pt/pt/Cursos/Licenciaturas/#{tipo}"
    doc = Nokogiri::HTML(open(url))


    doc.xpath('//td/a/@href').each do |e|

        if e.value.match(/pt\/cursos/)
    
            text = base_url+''+e.value+'horarios\n'
            
            file.write(text) 
            puts text
        end
    
    end
end
      
file.close unless file.nil?
