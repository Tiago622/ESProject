queue = ["SEGUNDA", "TERCA", "QUARTA", "QUINTA", "SEXTA"] #, "SABADO" #meter quando houve horarios com sabado

segunda_array= []
terca_array = []
quarta_array = []
quinta_array = []
sexta_array = []
sabado_array = []



queue.each do |ficheiro_dia_da_semana|
  line_num = 0
  nome_ficheiro = ficheiro_dia_da_semana + ".txt"

  novo_objecto = OpenStruct.new
  File.open(nome_ficheiro).each do |line|
      linha = line.split('/')
      semestre = "#{linha[1].split(": ")[1]}"
      ano_lec = "#{linha[2].split(": ")[1]}"
      turma = "#{linha[3].split(": ")[1]}" #turma
      ano_curso = "#{linha[4].split(": ")[1]}" #ano
      dia_s = "#{linha[6].split(": ")[1]}" #dia da semana
      curso= "#{linha[5].split(": ")[1]}" #curso
      hora_inicio = "#{linha[7].split(": ")[1].split(" - ")[0]}" #horas inicio
      hora_fim = "#{linha[7].split(": ")[1].split(" - ")[1]}" #horas fim
      mensagem = "#{linha[8].split(": ")[1]}" #texto
      
      if line_num %4 == 1
        tipo = mensagem
      elsif line_num %4 == 3
        sala = mensagem
        hora_fim = hora_fim
        case (dia_s)
          when "SEGUNDA" 
            segunda_array.push({:tipo=> tipo, :dia_semana=>dia_s, :hora_fim=> hora_fim, :sala=>sala, :responsavel=> responsavel, :semestre => semestre, :hora_inicio => hora_inicio, :curso => curso, :ano_curso => ano_curso, :turma => turma, :ano_lec => ano_lec, :cadeira => cadeira})
            puts "#{segunda_array}"
          when "TERCA"
            terca_array.push({:tipo=> tipo, :dia_semana=>dia_s, :hora_fim=> hora_fim, :sala=>sala, :responsavel=> responsavel, :semestre => semestre, :hora_inicio => hora_inicio, :curso => curso, :ano_curso => ano_curso, :turma => turma, :ano_lec => ano_lec, :cadeira => cadeira})
            puts "#{terca_array}"
          when "QUARTA"
            quarta_array.push({:tipo=> tipo, :dia_semana=>dia_s, :hora_fim=> hora_fim, :sala=>sala, :responsavel=> responsavel, :semestre => semestre, :hora_inicio => hora_inicio, :curso => curso, :ano_curso => ano_curso, :turma => turma, :ano_lec => ano_lec, :cadeira => cadeira})
            puts "#{quarta_array}"
          when "QUINTA"
            quinta_array.push({:tipo=> tipo, :dia_semana=>dia_s, :hora_fim=> hora_fim, :sala=>sala, :responsavel=> responsavel, :semestre => semestre, :hora_inicio => hora_inicio, :curso => curso, :ano_curso => ano_curso, :turma => turma, :ano_lec => ano_lec, :cadeira => cadeira})
            puts "#{quinta_array}"
          when "SEXTA"
            sexta_array.push({:tipo=> tipo, :dia_semana=>dia_s, :hora_fim=> hora_fim, :sala=>sala, :responsavel=> responsavel, :semestre => semestre, :hora_inicio => hora_inicio, :curso => curso, :ano_curso => ano_curso, :turma => turma, :ano_lec => ano_lec, :cadeira => cadeira})
            puts "#{sexta_array}"
          when "SABADO"
            sabado_array.push({:tipo=> tipo, :dia_semana=>dia_s, :hora_fim=> hora_fim, :sala=>sala, :responsavel=> responsavel, :semestre => semestre, :hora_inicio => hora_inicio, :curso => curso, :ano_curso => ano_curso, :turma => turma, :ano_lec => ano_lec, :cadeira => cadeira})
            puts "#{sabado_array}"
        end
        
      elsif line_num %4 == 2
        responsavel = mensagem
        
      else
        
        semestre = semestre
        hora_inicio = hora_inicio
        curso = curso
        ano_curso = ano_curso
        turma = turma
        ano_lec = ano_lec   
        cadeira = mensagem 
      end
    
    
   
      line_num += 1
     
  end
end

arrays= [segunda_array,terca_array,quarta_array,quinta_array,sexta_array,sabado_array]

arrays.each do |dia|
  dia.each do |entrada|
    
    Entrada.create(entrada)

  end
end
