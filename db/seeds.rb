# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

OrganicUnit.create([
    {name: 'Instituto Politécnico de Tomar', acronym: 'IPT'}
])

School.create([
    {name:'Escola Superior de Gestão de Tomar', acronym:'ESGT', address:"Quinta do Contador, Estrada da Serra, 2300 Tomar, Portugal", organic_unit_id:'1'},
    {name:'Escola Superior de Tecnologia de Abrantes', acronym:'ESTA', address:"Rua 17 de Agosto de 1808 s/n 2200-370 Abrantes", organic_unit_id:'1'},
    {name:'Escola Superior de Tecnologia de Tomar', acronym:'ESTT', address:"Quinta do Contador, Estrada da Serra, 2300 Tomar, Portugal", organic_unit_id:'1'}
])

Course.create([
    {name:'Gestão de Recursos Humanos e Comportamento Organizacional', school_id:'1'},
    {name:'Contabilidade e Gestão', school_id:'1'},
    {name:'Licenciatura em Engenharia Informática', school_id:'3'},
    {name:'Licenciatura em Engenharia Eletrotécnica e de Computadores', school_id:'3'}
])

Person.create([
    {name:'Alice Maria Domingos Reis Henriques', phone:'249328112', extension:'1202', email:'alice.henriques@ipt.pt', cabinet:'Artes, Design e Comunicação', job_title_1: 'Técnica Superior, Área Pedagógica do GGP', job_title_2: '', job_title_3: ''},
    {name:'Ana Catarina da Fonseca Henriques Freire', phone:'249 346 363', extension:'9172', email:'catarina.freire@ipt.pt', cabinet:'Gabinete de Relações Internacionais', job_title_1: 'Técnico Superior - GRI', job_title_2: '', job_title_3: ''}
])