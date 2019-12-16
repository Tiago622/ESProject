[![Build Status](https://travis-ci.org/Tiago622/ESProject.svg?branch=master)](https://travis-ci.org/Tiago622/ESProject)
[![Maintainability](https://api.codeclimate.com/v1/badges/15af951dcfeb046b9c4a/maintainability)](https://codeclimate.com/github/Tiago622/ESProject/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/15af951dcfeb046b9c4a/test_coverage)](https://codeclimate.com/github/Tiago622/ESProject/test_coverage)

# README

### Vagrant 

* Iniciar a máquina virtual 
```bash
vagrant up
```

* Entrar na máquina virtual em execução, ficando com acesso à shell (logout para sair da shell)
```bash
vagrant ssh
```

* Desligar a máquina virtual em execução
```bash
vagrant halt
```

* Parar a máquina virtual em execução e destruir todos os recursos criados
```bash
vagrant destroy
```

### Ligar o servidor Rails
```bash
cd /vagrant
rails server -b 0.0.0.0
```
Acesso: `localhost:3000`
 