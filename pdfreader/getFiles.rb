require 'open-uri'
require 'nokogiri'


lista_de_url=[]
nome_ficheiro="urls.txt"
base_url = "http://portal2.ipt.pt"
filename_base="horarios"

File.open(nome_ficheiro).each do |line|
    url2=line[0..-2]
    doc = Nokogiri::HTML(open(url2))
    #ta a dar erro, help ;_______; #deleteMeLater
    doc.xpath('//div/a[contains(text(), "semestre")]/@href]').each do |e|
                text = base_url+''+e.value   
                lista_de_url.push(text)
                puts text 
    end
end

num_cursos=0

lista_de_url.each do |url|
    filename=filename_base+''+num_cursos+'.pdf'
    #url2=url[0..-2]
    puts url2
    open(filename, 'wb') do |file|
        file << open(url2).read
    end
    num_cursos += 1
end