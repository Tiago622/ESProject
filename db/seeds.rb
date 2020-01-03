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
    {name:'Escola Superior de Tecnologia de Abrantes', acronym:'ESTA', address:"Rua 17 de Agosto de 1808 s/n
        2200-370 Abrantes", organic_unit_id:'1'},
    {name:'Escola Superior de Tecnologia de Tomar', acronym:'ESTT', address:"Quinta do Contador, Estrada da Serra, 2300 Tomar, Portugal", organic_unit_id:'1'}
])