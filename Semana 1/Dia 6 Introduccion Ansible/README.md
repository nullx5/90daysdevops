### Componentes ansible

| Componente  | Función                                                                 |
|-------------|-------------------------------------------------------------------------|
| Inventario  | Lista de hosts gestionados, normalmente en `/etc/ansible/hosts` o `inventory` |
| Playbooks   | "Recetas" de automatización escritas en archivos YAML                  |
| Módulos     | Unidades de acción como `apt`, `copy`, `service`, etc.                  |
| Roles       | Plantillas reusables para organizar y estructurar playbooks complejos   |
| ad hoc commands |  instrucciones que se ejecutan directamente desde la línea de comandos ansible CLI |
| ansible galaxy | repositorio de playbooks | 

### Niveles de Verbosidad ansible

| Nivel | Opción CLI                        | Descripción                                                                 |
|-------|-----------------------------------|-----------------------------------------------------------------------------|
| 0     | `ansible-playbook playbook.yml`  | Verbosidad por defecto. Muestra solo errores o información esencial.        |
| 1     | `ansible-playbook -v playbook.yml`   | Muestra tareas realizadas y cambios hechos.                                |
| 2     | `ansible-playbook -vv playbook.yml`  | Incluye detalles adicionales como salidas de comandos, módulos usados.     |
| 3     | `ansible-playbook -vvv playbook.yml` | Muestra información de conexión, variables y más detalles técnicos.         |
| 4     | `ansible-playbook -vvvv playbook.yml`| Muestra salida de depuración completa (incluye detalles SSH, etc.).        |
| 5     | `ansible-playbook -vvvvv playbook.yml`| Nivel de depuración extremo, raramente necesario.                          |

> Logs bonitos `ccze -A < ansible.log | grep "TASK"`
