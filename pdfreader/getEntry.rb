queue = ["SEGUNDA", "TERCA", "QUARTA", "QUINTA", "SEXTA"] #, "SABADO" #meter quando houve horarios com sabado

segunda_array= []
terca_array = []
quarta_array = []
quinta_array = []
sexta_array = []
sabado_array = []

disciplinas=[]
cursos=[]

queue.each do |ficheiro_dia_da_semana|
  line_num = 0
  nome_ficheiro = ficheiro_dia_da_semana + ".txt"
  
  tipo=""
  sala=""
  responsavel=""
  cadeira=""
  novo_objecto = OpenStruct.new
  File.open(Rails.root+"pdfreader/"+nome_ficheiro).each do |line|
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
        tipo = mensagem.split("\r\n")[0]
      elsif line_num %4 == 3
        sala = mensagem.split("\r\n")[0]
        case (dia_s)
          when "SEGUNDA" 
            segunda_array.push({:lesson_type => tipo, :week_day=>dia_s, :end_time => hora_fim, :space=>sala, :person=> responsavel, :semestre => semestre,:start_time => hora_inicio, :curso => curso, :ano_curso => ano_curso, :turma => turma, :ano_lec => ano_lec, :name => cadeira})
            puts "#{segunda_array}"
          when "TERCA"
            terca_array.push({:lesson_type => tipo, :week_day=>dia_s, :end_time => hora_fim, :space=>sala, :person=> responsavel, :semestre => semestre,:start_time => hora_inicio, :curso => curso, :ano_curso => ano_curso, :turma => turma, :ano_lec => ano_lec, :name => cadeira})
            puts "#{terca_array}"
          when "QUARTA"
            quarta_array.push({:lesson_type => tipo, :week_day=>dia_s, :end_time => hora_fim, :space=>sala, :person=> responsavel, :semestre => semestre,:start_time => hora_inicio, :curso => curso, :ano_curso => ano_curso, :turma => turma, :ano_lec => ano_lec, :name => cadeira})
            puts "#{quarta_array}"
          when "QUINTA"
            quinta_array.push({:lesson_type => tipo, :week_day=>dia_s, :end_time => hora_fim, :space=>sala, :person=> responsavel, :semestre => semestre,:start_time => hora_inicio, :curso => curso, :ano_curso => ano_curso, :turma => turma, :ano_lec => ano_lec, :name => cadeira})
            puts "#{quinta_array}"
          when "SEXTA"
            sexta_array.push({:lesson_type => tipo, :week_day=>dia_s, :end_time => hora_fim, :space=>sala, :person=> responsavel, :semestre => semestre,:start_time => hora_inicio, :curso => curso, :ano_curso => ano_curso, :turma => turma, :ano_lec => ano_lec, :name => cadeira})
            puts "#{sexta_array}"
          when "SABADO"
            sabado_array.push({:lesson_type => tipo, :week_day=>dia_s, :end_time => hora_fim, :space=>sala, :person=> responsavel, :semestre => semestre,:start_time => hora_inicio, :curso => curso, :ano_curso => ano_curso, :turma => turma, :ano_lec => ano_lec, :name => cadeira})
            puts "#{sabado_array}"
        end
        disciplinas.push({:name=> cadeira, :course=> curso})
        cursos.push(curso)
      elsif line_num %4 == 2
        responsavel = mensagem.split("\r\n")[0]
        
      else
        cadeira = mensagem.split("\r\n")[0]
      end
    
    
   
      line_num += 1
     
  end
end

arrays= [segunda_array,terca_array,quarta_array,quinta_array,sexta_array,sabado_array]

disciplinas = disciplinas.uniq
cursos= cursos.uniq

OrganicUnit.create({:name=>"IPT", :acronym=> "IPT"})

School.create({:name=> "ESTTss", :acronym=> "IPT", :address=>"sim", :organic_unit=> "IPT"})

cursos.each do |curso|
  puts curso
  Course.create({:name=> curso, :School=>"ESTTss"})
end

disciplinas.each do |disciplina|
  puts disciplina
  Discipline.create(disciplina)

end

arrays.each do |dia|
  dia.each do |entrada|
    puts entrada
    Lesson.create(entrada)

  end
end
