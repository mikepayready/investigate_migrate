namespace :prep do
  task :reset do
    sh({ "RAILS_ENV" => "prep" }, "bin/rails db:drop")
  end

  task :setup do
    sh({ "RAILS_ENV" => "prep" }, "bin/rails db:create")
    sh({ "RAILS_ENV" => "prep" }, "bin/rails db:migrate")
    sh({ "RAILS_ENV" => "prep" }, "bin/rails prep:drop_ar_tables")
    sh({ "RAILS_ENV" => "prep" }, "bin/rails data:insert")
  end

  task drop_ar_tables: :environment do
    ApplicationRecord.connection.execute "DROP TABLE schema_migrations"
    ApplicationRecord.connection.execute "DROP TABLE ar_internal_metadata"
  end
end
