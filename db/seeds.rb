Dir[Rails.root.join('db', 'seeds_deployment', '*.rb').to_s].sort.each do |file|
  puts "Loading db/seeds_deployment/#{file.split(File::SEPARATOR).last}"
  load(file)
end