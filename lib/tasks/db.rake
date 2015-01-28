namespace :db do

  desc "Fill database with dummy data"
  task populate: :environment do

    Rake::Task['db:reset'].invoke
    Rake::Task['pages:populate'].execute
    Rake::Task['screencasts:populate'].execute

  end

end