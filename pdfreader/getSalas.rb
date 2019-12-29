require 'open-uri'
require 'nokogiri'
require 'json'

def fromStringArrayOfObjectsToArrayOfObjects(colecao)
    colec=[]
    n=0
    begin
        colecao.split("},{").each do |entrada|
            
            if n == 0
                entrada = entrada[2..]
            end
            entrada = entrada.split(",\"FuncaoFR\":")[0]
            nome_sala = entrada.split(",\"Nome\":\"")[1].split("\",\"FuncaoPT\":\"")[0]
            description = entrada.split(",\"Nome\":\"")[1].split("\",\"FuncaoPT\":\"")[1]
            #puts nome_sala 
            #puts description
            cena= {:nome=>nome_sala,:description=>description.split("\"")[0]}
            colec.push(cena)
            puts cena
            
            #puts entrada
            #puts type(entrada)
    end
    rescue NoMethodError => e
       return
    end    
    return cena

end


lista_de_salas=[]
nome_ficheiro="salas.txt"
base_url = "http://appmobile.ipt.pt/api/salasapi"
letras=["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

filename_base="salas"
letras.each do |letra|
    4.times do |andar|
        url = base_url + "\/#{letra}\/#{andar}"
        puts url
        doc = Nokogiri::HTML(open(url))
        doc = doc.xpath('//p').to_s[3..-5]
        puts doc
        fromStringArrayOfObjectsToArrayOfObjects(doc)
        #Space.create(^)
        
    end
end

lista_de_salas.each do |sala|
    Space.create({:name=> sala.split(",")[0] , :description=>sala.split(",")[1]})
end