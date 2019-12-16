
line_num = 0 
queue = ["SEGUNDA", "TERCA", "QUARTA", "QUINTA", "SEXTA", "SABADO"]

File.open('entradas.txt').each do |line|
    linha = line.split('/')
    dia_s = "#{linha[6].split(": ")[1]}"
    
    nome_fich = queue.index(dia_s)
    if !queue.include? dia_s
        nome_fich =  1 
        dia_s =  "TERCA"
    end
    
    #puts "#{nome_fich} : #{dia_s}"

    begin
        file = File.open("#{dia_s}.txt", "a")
        file.write("#{line}") 
    rescue IOError => e
        #some error occur, dir not writable etc.
    ensure
        file.close unless file.nil?
        
    end


end