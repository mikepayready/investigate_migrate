# README

This is a simple Rails project to demonstrate an issue with using an existing
database in Rails.

If you have an existing database with data in it (but without a
`schema_migrations` table), and load your schema into a new Rails application
via `bin/rails db:schema:dump`, then the first migration will drop all the data
in your database.

I prepared this application by setting up a database using the `prep`
environment, inserting some data, and then generated the "real" schema via
`bin/rails db:schema:dump`. From there, if you run `bin/rails db:migrate`, all
the data gets dropped.

You can see a real time demonstration of this by cloning this project, bundling,
and running:

```
bin/rails demo
```

The `demo` task will do the following:
* Drop the database by running `prep:reset`
* Create, migrate, drop the `schema_migrations` table, and insert some dummy
  data via `prep:setup`
* Show the dummy data via `data:show`
* Run `db:migrate`, which truncates the data
* Shows the now deleted data via `data:show`
