class Createlesson < ActiveRecord::Migration
	def change
		create_table :lesson do |t|
			t.datetime :data_inicio
			t.datetime :data_fim
			t.string :tipo
			t.int :Ano
			t.int :Sementre
			t.int :turma
			t.string :dia_semana
			t.int :estado
			t.string :ambito 
			t.string :curso
			t.string :lesson
			t.sting :responsavel 
			t.datetime :data
			t.text :motivo_rejeicao
         end
    end
end
