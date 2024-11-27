namespace :data do
  task insert: :environment do
    Example.create! value: "Foo"
    Example.create! value: "Bar"
    Example.create! value: "Baz"
  end

  task show: :environment do
    puts "#{Example.count} records"

    Example.all.each do |object|
      puts "#{object.id}: #{object.value}"
    end
  end
end
