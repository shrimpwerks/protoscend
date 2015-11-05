## routes
An application that serves data regarding the climbing routes available at the indoor climbing center at Oregon State University. The previous version of the full site already exists at [iccroutes](https://iccroutes.com). When this project is finished, it will replace it.

#### Setup
Dependencies
- MySQL
- Ruby (2.2.3)
- [Heroku Toolbelt](https://toolbelt.heroku.com/)
- [Foreman](https://github.com/ddollar/foreman)

Get the code
```sh
git clone git@github.com:skeltont/ICCapi.git
```

Setup your environment
```sh
bin/setup
```

Modify .env as needed
```sh
vim .env
```

Start Foreman
```sh
foreman start
```

Verify that the app is up and running
```sh
open http://localhost:3000
# Login using one of the profiles in db/seeds.rb
```
