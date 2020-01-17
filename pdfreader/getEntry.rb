require 'byebug'
queue = ["SEGUNDA", "TERCA", "QUARTA", "QUINTA", "SEXTA"] #, "SABADO" #meter quando houve horarios com sabado
arrays=[]


unidade= {:name=>"IPT", :acronym=> "IPT"}

@ou = OrganicUnit.create(unidade)

escola= {:name=> "ESTTss", :acronym=> "ESTT", :address=>"sim", :organic_unit=> @ou}

@escolae = School.create(escola)


queue.each do |ficheiro_dia_da_semana|
  line_num = 0
  nome_ficheiro = ficheiro_dia_da_semana + ".txt"
  
  tipo=""
  sala=""
  responsavel=""
  cadeira=""
  hora_inicio=""
  hora_fim=""
  File.open(Rails.root+"pdfreader/"+nome_ficheiro).each do |line|
      linha = line.split('/')
      semestre = "#{linha[1].split(": ")[1]}"
      ano_lec = "#{linha[2].split(": ")[1]}"
      puts "ano_lec:"
      puts ano_lec
      puts "######"
      turma = "#{linha[3].split(": ")[1]}" #turma
      
      ano_curso = "#{linha[4].split(": ")[1]}" #ano
      puts "ano_curso:"
      puts ano_curso
      puts "######"
      dia_s = "#{linha[6].split(": ")[1]}" #dia da semana
      curso= "#{linha[5].split(": ")[1]}" #curso
      @cursoe = Course.find_by(:name=>curso) 
      if @cursoe.nil?
        @cursoe = Course.create(:name=>curso, :school=>@escolae)
      end
      mensagem = "#{linha[8].split(": ")[1]}" #texto
      
      if line_num %4 == 1
        tipo = mensagem.split("\r\n")[0]
      elsif line_num %4 == 3
        hora_fim = "#{linha[7].split(": ")[1].split(" - ")[1]}" #horas fim
        hora_fim = hora_fim.split(".").join(":")+":00"
        sala = mensagem.split("\r\n")[0]
        @salae = Space.find_by(:name=>sala)
        if @salae.nil?
          #@salae =Space.create({:name=>sala,:description=>sala}) 
          puts sala
        end
        @less = Lesson.create({:lesson_type => tipo, :week_day=>dia_s, :end_time => hora_fim, :space=> @salae, :person=> @responsavele, :start_time => hora_inicio, :name => cadeira, :discipline => @disc}) #:semestre => semestre, :course => @curso, :ano_curso => ano_curso, :turma => turma, :ano_lec => ano_lec
      elsif line_num %4 == 2
        responsavel = mensagem.split("\r\n")[0]
        @responsavele = Person.find_by(:name=>responsavel) 
        if @responsavele.nil?
          puts responsavel
          @responsavele = Person.create(:name=>responsavel)
        end
      else
        hora_inicio = "#{linha[7].split(": ")[1].split(" - ")[0]}" #horas inicio
        hora_inicio = hora_inicio.split(".").join(":")+":00"
        cadeira = mensagem.split("\r\n")[0]
        @disc=Discipline.find_by(:name=>cadeira)
        if @disc.nil?
          @disc=Discipline.create(:name=>cadeira, :course=>@cursoe)
        end
      end
      line_num += 1
      
      @horario = Schedule.find_by({:school_year=>ano_curso, :year=>ano_lec, :schedule_class=> turma, :course=> @cursoe})
      if @horario.nil?
        @horario = Schedule.create({:school_year=>ano_curso, :year=>ano_lec, :schedule_class=> turma, :version=>"1", :course=> @cursoe})
      else
        pp @horario
      end
      LessonSchedule.create(:lesson=>@less, :schedule=>@horario)

  end
end

#arrays= [segunda_array,terca_array,quarta_array,quinta_array,sexta_array,sabado_array]
#puts arrays.size
#puts arrays.uniq.size
arrays.each do |entrada|
  
 # pp entrada

#  
  # byebug
  
end
