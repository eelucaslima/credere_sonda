# Credere - Sonda #

### Executando aplicativo localmente ###

Instruções em [api/README.md](https://github.com/eelucaslima/credere_sonda/blob/master/api/README.md)

### Colocando aplicativo para produção com o Heroku ###

```bash
$ cd api

$ heroku login --interactive

$ git init

$ heroku apps:create <app-name>

$ git remote rename heroku api

$ git add .

$ git commit -m --allow-empty

$ git push api master
