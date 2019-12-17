require 'pdf-reader'
require 'iguvium'
# require 'byebug'

file = File.open("entradas.txt", "w");
file.write("") 
file.close unless file.nil?
  
filename = "LEI.pdf"

pdf_reader = PDF::Reader.new(filename)
iguvium_pages = Iguvium.read(filename)
pagina = 0
num_paginas=pdf_reader.page_count-1;



for pagina in 0..num_paginas do
  

  curso = pdf_reader.pages[pagina].text.match /CURSO DE:(.+)ANO:/
  ano = pdf_reader.pages[pagina].text.match /ANO: .+([1-5]+)º/
  turma = pdf_reader.pages[pagina].text.match /Turma ([A-Z])/
  ano_lectivo = pdf_reader.pages[pagina].text.match /ANO LECTIVO: +(20[1-2][0-9] \| [1-2][0-9]+)/
  semestre = pdf_reader.pages[pagina].text.match /SEMESTRE: +([1-2])º/
  
  curso =  "#{curso[1].strip}"
  year =   "#{ano[1].strip}"
  classe =  "#{turma[1]}"
  ano_ac = "#{ano_lectivo[1]}"
  semestre = "#{semestre[1]}"
  
  dias_da_semana = pdf_reader.pages[pagina].text.match /\nHORAS +([A-ZÇÁ ]+)\n/
  dias_da_semana = dias_da_semana[1].split
  #puts "Days of the week found: #{dias_da_semana.length}: #{dias_da_semana.join(", ")}"
  
  pdf_reader.pages[pagina].text 
  tables = iguvium_pages[pagina].extract_tables!
  schedule_table = tables.first.to_a
  
  schedule_table.each do |l|
    hour = l[0]
    l.each_with_index do |d,i|
      if i > 0
        unless d.empty? 
          valor = "/Semestre: #{semestre}/AnoLec: #{ano_ac} /Class: #{classe}/Year: #{year}/Course: #{curso}/Day: #{dias_da_semana[i-1]}/Hour: #{hour}/Text: #{d}\n"
          begin
            file = File.open("entradas.txt", "a")
            file.write(valor) 
          rescue IOError => e
            #some error occur, dir not writable etc.
          ensure
            file.close unless file.nil?
            
          end
        end
      end
    end
    
  end
  
  

end

