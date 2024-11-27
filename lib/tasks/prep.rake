namespace :prep do
  task :reset do
    sh({ "RAILS_ENV" => "prep" }, "bin/rails db:drop")
  end

  task :setup do
    sh({ "RAILS_ENV" => "prep" }, "bin/rails db:create")
    sh({ "RAILS_ENV" => "prep" }, "bin/rails db:migrate")
    sh({ "RAILS_ENV" => "prep" }, "bin/rails prep:drop_ar_schema_migrations")
    sh({ "RAILS_ENV" => "prep" }, "bin/rails data:insert")
  end

  task drop_ar_schema_migrations: :environment do
    ApplicationRecord.connection.execute "DROP TABLE schema_migrations"
  end
end
