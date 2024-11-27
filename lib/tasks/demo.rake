task :demo do
  sh "bin/rails prep:reset"
  sh "bin/rails prep:setup"

  puts "\n\nData before migrating for the first time:\n-----"
  sh "bin/rails data:show"
  puts "\n\n"

  sh "bin/rails db:migrate"

  puts "\n\nData after migrating for the first time:\n-----"
  sh "bin/rails data:show"
end
