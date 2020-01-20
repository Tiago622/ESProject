require 'byebug'
require 'csv'
require 'net/http'
require 'json'

rooms_list = []

("A".."Z").each do |letter|
	3.times do |page|
		uri = URI("http://appmobile.ipt.pt/api/salasapi/#{letter}/#{page}")
		puts "Querying: #{uri}"
		response = Net::HTTP.get(uri)
		data_json = JSON.parse(response)
		rooms_list.concat data_json unless data_json.nil?
	end
end

rooms_list.uniq!

puts "Fetched #{rooms_list.size} rooms."

filename = "ipt_rooms.csv"

CSV.open("#{filename}", "w") do |csv|
	csv.to_io.write "\uFEFF" # use CSV#to_io to write BOM directly 
	csv << rooms_list.first.keys
  	rooms_list.each do |room|
		puts "Saving: #{room["FuncaoPT"]} - #{room["Nome"]}..."
		Space.create({:name=>room["Nome"],:description=>room["FuncaoPT"]})  
    	csv << room.values
  	end
end
puts "Saved #{rooms_list.size} rooms to #{filename}."

ficheiro = File.read(Rails.root+"pdfreader/pessoas.csv")

table = CSV.parse(ficheiro, headers: true)

table.each do |linha|
  nome=linha['nome'].split(" ")[0]+ " "+linha['nome'].split(" ")[-1]
  if linha["gabinete"]
    gabinete = linha["gabinete"].split(" ").join()
  else
    gabinete= ""
  end

  Person.create({:name=>nome,:email=>linha['email'], :cabinet=>gabinete, :job_title_1=>linha["cargo1"]})
  puts "#{nome} : #{linha['email']}"
end



queue = ["SEGUNDA", "TERCA", "QUARTA", "QUINTA", "SEXTA"] #, "SABADO" #meter quando houve horarios com sabado
arrays=[]




@ou = OrganicUnit.find_by({:acronym=>"IPT"})
if @ou.nil?
  unidade= {:name=>"IPT", :acronym=> "IPT"}
  @ou = OrganicUnit.create(unidade)
end

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
  dia_s=""
  File.open(Rails.root+"pdfreader/"+nome_ficheiro).each do |line|
    
      linha = line.split('/')
      semestre = "#{linha[1].split(": ")[1]}"
      ano_lec = linha[2].split(": ")[1].split(" | ").join("/")
      turma = "#{linha[3].split(": ")[1]}" #turma
      
      ano_curso = "#{linha[4].split(": ")[1]}" #ano
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
        nome_feio= ""+ cadeira+ " "+ tipo + " " +responsavel + " " + sala + " " + dia_s+""
        @less = Lesson.find_by({:end_time => hora_fim, :week_day=>dia_s,:space=> @salae, :person=> @responsavele, :start_time => hora_inicio})
        if @less.nil?
          @less = Lesson.create({:lesson_type => tipo, :week_day=>dia_s, :end_time => hora_fim, :space=> @salae, :person=> @responsavele, :start_time => hora_inicio, :name => nome_feio, :discipline => @disc}) #:semestre => semestre, :course => @curso, :ano_curso => ano_curso, :turma => turma, :ano_lec => ano_lec
        else
          pp @less
        end

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
      nome_lindo= curso +": "+ano_curso + "ºano turma " + turma + " ano: " + ano_lec + ": " +semestre+ "º semestre"

      @horario = Schedule.find_by({:school_year=>ano_lec, :year=>ano_curso, :schedule_class=> turma, :version=>"1", :course=> @cursoe, :name=>nome_lindo, :semester=>semestre})
      if @horario.nil?
        @horario = Schedule.create({:school_year=>ano_lec, :year=>ano_curso, :schedule_class=> turma, :version=>"1", :course=> @cursoe, :name=>nome_lindo, :semester=>semestre})
      else
        #pp @horario
      end
      @rel = LessonSchedule.find_by({:lesson=>@less, :schedule=>@horario})
      if @rel.nil?
        LessonSchedule.create({:lesson=>@less, :schedule=>@horario})
      end

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
