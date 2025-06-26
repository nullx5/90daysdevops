### Arquitectura app roxs-voting-app

![https://raw.githubusercontent.com/roxsross/roxs-devops-project90/master/docs/5.png](https://raw.githubusercontent.com/roxsross/roxs-devops-project90/master/docs/5.png)


```
[ Vote (Flask) ] ---> Redis ---> [ Worker (Node.js) ] ---> PostgreSQL
                                       ↓
                               [ Result (Node.js) ]
```
