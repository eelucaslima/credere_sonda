# Credere - Sonda #

### Deploy to production with Heroku ###

```bash
$ cd api

$ heroku login --interactive

$ git init

$ heroku apps:create <app-name>

$ git remote rename heroku api

$ git add .

$ git commit -m --allow-empty

$ git push api master
