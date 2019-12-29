require 'ostruct'


queue = ["SEGUNDA", "TERCA", "QUARTA", "QUINTA", "SEXTA"] #, "SABADO" #meter quando houve horarios com sabado

stateObjects = OpenStruct.new
stateObjects.SEGUNDA = []
stateObjects.TERCA = []
stateObjects.QUARTA = []
stateObjects.QUINTA = []
stateObjects.SEXTA = []
stateObjects.SABADO = []



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
            stateObjects.SEGUNDA.push({:tipo=> tipo, :hora_fim=> hora_fim, :sala=>sala, :responsavel=> responsavel, :semestre => semestre, :hora_inicio => hora_inicio, :curso => curso, :ano_curso => ano_curso, :turma => turma, :ano_lec => ano_lec, :cadeira => cadeira})
            puts "#{stateObjects.SEGUNDA}"
          when "TERCA"
            stateObjects.TERCA.push({:tipo=> tipo, :hora_fim=> hora_fim, :sala=>sala, :responsavel=> responsavel, :semestre => semestre, :hora_inicio => hora_inicio, :curso => curso, :ano_curso => ano_curso, :turma => turma, :ano_lec => ano_lec, :cadeira => cadeira})
            puts "#{stateObjects.TERCA}"
          when "QUARTA"
            stateObjects.QUARTA.push({:tipo=> tipo, :hora_fim=> hora_fim, :sala=>sala, :responsavel=> responsavel, :semestre => semestre, :hora_inicio => hora_inicio, :curso => curso, :ano_curso => ano_curso, :turma => turma, :ano_lec => ano_lec, :cadeira => cadeira})
            puts "#{stateObjects.QUARTA}"
          when "QUINTA"
            stateObjects.QUINTA.push({:tipo=> tipo, :hora_fim=> hora_fim, :sala=>sala, :responsavel=> responsavel, :semestre => semestre, :hora_inicio => hora_inicio, :curso => curso, :ano_curso => ano_curso, :turma => turma, :ano_lec => ano_lec, :cadeira => cadeira})
            puts "#{stateObjects.QUINTA}"
          when "SEXTA"
            stateObjects.SEXTA.push({:tipo=> tipo, :hora_fim=> hora_fim, :sala=>sala, :responsavel=> responsavel, :semestre => semestre, :hora_inicio => hora_inicio, :curso => curso, :ano_curso => ano_curso, :turma => turma, :ano_lec => ano_lec, :cadeira => cadeira})
            puts "#{stateObjects.SEXTA}"
          when "SABADO"
            stateObjects.SABADO.push({:tipo=> tipo, :hora_fim=> hora_fim, :sala=>sala, :responsavel=> responsavel, :semestre => semestre, :hora_inicio => hora_inicio, :curso => curso, :ano_curso => ano_curso, :turma => turma, :ano_lec => ano_lec, :cadeira => cadeira})
            puts "#{stateObjects.SABADO}"
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
