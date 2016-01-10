## routes
An application for managing climbing routes at the Indoor Climbing Center at Oregon State University.

The previous version of the site already at http://iccroutes.com. When this project is finished, it will replace it.

#### Setup
Dependencies
- [Postgres](http://www.postgresql.org)
- [Ruby](https://www.ruby-lang.org/en/)
- [Bundler](http://bundler.io)
- [Foreman](https://github.com/ddollar/foreman)

Getting Started
```sh
git clone git@github.com:temporary-name/ICCapi.git
cd ICCapi/

bundle install

cp .sample.env .env
vim .env # Modify for your environment

foreman run rake db:create
foreman run rake db:schema:load
foreman run rake db:seed

foreman start

open http://localhost:5000
```
