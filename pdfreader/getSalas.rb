    require 'open-uri'
    require 'nokogiri'
    require 'json'
        def fromStringArrayOfObjectsToArrayOfObjects(colecao, letra)
            colec=[]
            n=0
            begin
                colecao.split("},{").each do |entrada|
                    
                    if n == 0
                    entrada = entrada[2..-1]
                    end
                    entrada = entrada.split(",\"FuncaoFR\":")[0]
                    nome_sala = entrada.split(",\"Nome\":\"")[1].split("\",\"FuncaoPT\":\"")[0]
                    description = entrada.split(",\"Nome\":\"")[1].split("\",\"FuncaoPT\":\"")[1]
                    #puts nome_sala 
                    #puts description
                    cena= {:name=>nome_sala,:description=>description.split("\"")[0]}#, :letter=>letra}
                    colec.push(cena)
                    puts cena
                    
                    #puts entrada
                    #puts type(entrada)
            end
            rescue NoMethodError => e
               return
            end    
            return colec
        
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
                a = fromStringArrayOfObjectsToArrayOfObjects(doc, letra)
                lista_de_salas.push(a)
                
            end
        end
        lista_de_salas = lista_de_salas.uniq
        lista_de_salas.each do |sala|
           Space.create(sala)
        end
        
    #end
 # end
