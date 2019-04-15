# Fakeflix Admin

This is the base project of Fakeflix Admin.

## Steps to run the app

```bash
bundle install
rails db:setup
```

## Steps to recreate the app:

**Generate new project**
```bash
$ rails new fakeflix-admin --database=postgresql --skip-test
```

**Generate the model Movie**
```bash
$ rails g model Movie title:string description:text rating:integer duration:integer price:integer status:string progress:integer
```

**Generate the model Serie**
```bash
$ rails g model Serie title:string description:text rating:integer price:integer status:string
```

**Generate the model Episode**
```bash
$ rails g model Episode title:string description:text duration:integer serie:references progress:integer
```

**Generate the model Rental**
```bash
$ rails g model Rental paid_price:integer rentable:references{polymorphic}:index
```

**Create the database**
```bash
$ rake db:create
```

**Run the migrations**
```bash
$ rake db:migrate
```
