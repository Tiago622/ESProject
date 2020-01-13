require 'byebug'
queue = ["SEGUNDA", "TERCA", "QUARTA", "QUINTA", "SEXTA"] #, "SABADO" #meter quando houve horarios com sabado

segunda_array= []
terca_array = []
quarta_array = []
quinta_array = []
sexta_array = []
sabado_array = []

#disciplinas=[]
#cursos=[]
#people=[]

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
      turma = "#{linha[3].split(": ")[1]}" #turma
      ano_curso = "#{linha[4].split(": ")[1]}" #ano
      dia_s = "#{linha[6].split(": ")[1]}" #dia da semana
      curso= "#{linha[5].split(": ")[1]}" #curso
      @cursoe = Course.find_by(:name=>curso) 
      if @cursoe.nil?
        Course.create(:name=>curso, :school=>@escolae)
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
          puts sala
        end

        case (dia_s)
          when "SEGUNDA" 
            segunda_array.push({:lesson_type => tipo, :week_day=>dia_s, :end_time => hora_fim, :space=> @salae, :person=> @responsavele, :start_time => hora_inicio, :name => cadeira, :discipline => @disc}) #:semestre => semestre, :course => @curso, :ano_curso => ano_curso, :turma => turma, :ano_lec => ano_lec
            puts "#{segunda_array}"
          when "TERCA"
            terca_array.push({:lesson_type => tipo, :week_day=>dia_s, :end_time => hora_fim, :space=> @salae, :person=> @responsavele,:start_time => hora_inicio  , :name => cadeira, :discipline => @disc})
            puts "#{terca_array}"
          when "QUARTA"
            quarta_array.push({:lesson_type => tipo, :week_day=>dia_s, :end_time => hora_fim, :space=> @salae, :person=> @responsavele,:start_time => hora_inicio  , :name => cadeira, :discipline => @disc})
            puts "#{quarta_array}"
          when "QUINTA"
            quinta_array.push({:lesson_type => tipo, :week_day=>dia_s, :end_time => hora_fim, :space=> @salae, :person=> @responsavele,:start_time => hora_inicio  , :name => cadeira, :discipline => @disc})
            puts "#{quinta_array}"
          when "SEXTA"
            sexta_array.push({:lesson_type => tipo, :week_day=>dia_s, :end_time => hora_fim, :space=> @salae, :person=> @responsavele,:start_time => hora_inicio  , :name => cadeira, :discipline => @disc})
            puts "#{sexta_array}"
          when "SABADO"
            sabado_array.push({:lesson_type => tipo, :week_day=>dia_s, :end_time => hora_fim, :space=> @salae, :person=> @responsavele,:start_time => hora_inicio  , :name => cadeira, :discipline => @disc})
            puts "#{sabado_array}"
        end
        #disciplinas.push({:name=> cadeira, :course=> @curso})
        #cursos.push(curso)
      elsif line_num %4 == 2
        responsavel = mensagem.split("\r\n")[0]
        @responsavele = Person.find_by(:name=>responsavel) 
        if @responsavele.nil?
          puts responsavel
          Person.create(:name=>responsavel)
        end
        #people.push(responsavel)
        
      else
        hora_inicio = "#{linha[7].split(": ")[1].split(" - ")[0]}" #horas inicio
        hora_inicio = hora_inicio.split(".").join(":")+":00"
        cadeira = mensagem.split("\r\n")[0]
        @disc=Discipline.find_by(:name=>cadeira)
        if @disc.nil?
          Discipline.create(:name=>cadeira, :course=>@cursoe)
        end
      end
    
    
   
      line_num += 1
     
  end
end

arrays= [segunda_array,terca_array,quarta_array,quinta_array,sexta_array,sabado_array]

#disciplinas = disciplinas.uniq
#cursos= cursos.uniq
#people= people.uniq


#cursos.each do |curso|
  #puts curso
  #Course.create({:name=> curso, :school=>@escolae})
#end

#disciplinas.each do |disciplina|
  #puts disciplina
  #Discipline.create(disciplina)

#end

#people.each do |person|
  #Person.create(person)
#end
arrays.each do |dia|
  dia.each do |entrada|
    puts entrada
    @less = Lesson.create(entrada)
    # byebug
  end
end
