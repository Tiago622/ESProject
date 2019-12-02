require 'ostruct'


queue = ["SEGUNDA", "TERCA", "QUARTA", "QUINTA", "SEXTA"] #, "SABADO" #meter quando houve horarios com sabado

stateObjects = OpenStruct.new
stateObjects.SEGUNDA=[]
stateObjects.TERCA=[]
stateObjects.QUARTA=[]
stateObjects.QUINTA=[]
stateObjects.SEXTA=[]
stateObjects.SABADO=[]



queue.each do |ficheiro_dia_da_semana|
  line_num = 0
  nome_ficheiro= ficheiro_dia_da_semana + ".txt"

  novo_objecto = OpenStruct.new
  File.open(nome_ficheiro).each do |line|
    
      #print "#{line_num += 1} #{line}"
      linha=line.split('/')
      #puts "#{linha[0].split(": ")[1]}"
      #branco= "#{linha[0].split(": ")[1]}"
      
      #puts "#{linha[1].split(": ")[1]}"
      semestre= "#{linha[1].split(": ")[1]}"

      #puts "#{linha[2].split(": ")[1]}"
      ano_lec= "#{linha[2].split(": ")[1]}"

      #puts "#{linha[3].split(": ")[1]}" #turma
      turma= "#{linha[3].split(": ")[1]}" #turma
      
      #puts "#{linha[4].split(": ")[1]}" #ano
      ano_curso= "#{linha[4].split(": ")[1]}" #ano
      
      #puts "#{linha[6].split(": ")[1]}" #dia da semana
      dia_s = "#{linha[6].split(": ")[1]}" #dia da semana
      
      #puts "#{linha[5].split(": ")[1]}" #curso
      curso= "#{linha[5].split(": ")[1]}" #curso
      
      #puts "#{linha[7].split(": ")[1].split(" - ")[0]}" #horas inicio
      hora_inicio = "#{linha[7].split(": ")[1].split(" - ")[0]}" #horas inicio
      
      #puts "#{linha[7].split(": ")[1].split(" - ")[1]}" #horas fim
      hora_fim = "#{linha[7].split(": ")[1].split(" - ")[1]}" #horas fim
      
      #puts "#{linha[8].split(": ")[1]}" #texto
      mensagem= "#{linha[8].split(": ")[1]}" #texto
      if line_num %4 ==1
        #puts "1 Tipo: #{ mensagem}"
        novo_objecto.tipo=mensagem
      elsif line_num %4 ==3
        #puts "3 Sala: #{mensagem}"
        novo_objecto.sala=mensagem
        novo_objecto.hora_fim=hora_fim
        case (dia_s)
          when "SEGUNDA"
            stateObjects.SEGUNDA.push(novo_objecto)
            #puts "#{stateObjects.SEGUNDA}"
          when "TERCA"
            stateObjects.TERCA.push(novo_objecto)
            #puts "#{stateObjects.TERCA}"
          when "QUARTA"
            stateObjects.QUARTA.push(novo_objecto)
            #puts "#{stateObjects.QUARTA}"
          when "QUINTA"
            stateObjects.QUINTA.push(novo_objecto)
            #puts "#{stateObjects.QUINTA}"
          when "SEXTA"
            stateObjects.SEXTA.push(novo_objecto)
            #puts "#{stateObjects.SEXTA}"
          when "SABADO"
            stateObjects.SABADO.push(novo_objecto)
            #puts "#{stateObjects.SABADO}"
        end
        novo_objecto = OpenStruct.new
      elsif line_num %4==2
        #puts "2 Prof: #{ mensagem}"
        novo_objecto.Prof
        
      else
        #puts "0 Cadeira: #{mensagem}"
        novo_objecto.semestre = semestre
        novo_objecto.hora_inicio = hora_inicio
        novo_objecto.curso = curso
        novo_objecto.ano_curso = ano_curso
        novo_objecto.turma = turma
        novo_objecto.ano_lec = ano_lec    
      end
    
    
   
      line_num+=1
     
  end
end
