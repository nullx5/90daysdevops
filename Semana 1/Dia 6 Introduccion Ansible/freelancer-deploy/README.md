## Prerequisitos

 freelancer-deploy
├──  files
│  └──  nginx.conf
├──  inventory
├──  playbook.yml
├──  README.md
└──  Vagrantfile

### Instalar en tu máquina local:

`sudo apt install ansible -y`
`pip install ansible`

- vagrant --version 
- ansible --version 
- virtualbox --version 

### Ejecucíon
- vagrant up
- open http://192.168.33.10

### Componentes:
- Inventario	Lista de hosts gestionados (/etc/ansible/hosts)
- Playbooks	"Recetas" de automatización (archivos YAML)
- Módulos	Unidades de acción (ej: apt, copy, service)
- Roles	Plantillas reusables para organizar playbooks complejos

### Comandos ad-hoc
- ansible all -m ping -u admin  # test de conexion
- ansible webservers -m apt -a "name=nginx state=present" -b --become-user=root # Instala nginx
- ansible all -m service -a "name=nginx state=restarted" # reincia servicios
- ansible-playbook primer-playbook.yml # ejecuta playbook
- ansible-playbook playbook.yml -vvv  # Modo verboso
- ansible-playbook playbook.yml --check
- ansible-doc <module>
- ansible-playbook -i 192.168.1.100, -u ubuntu --private-key ~/.ssh/id_rsa playbook.yml
> Ver hosts disponibles en inventario
- ansible-inventory -i hosts.ini --list

> Probar conexión SSH
- ansible all -i hosts.ini -m ping

> Ejecutar comando ad-hoc
- ansible webservers -i hosts.ini -a "free -h"
