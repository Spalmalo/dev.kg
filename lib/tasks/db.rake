namespace :db do

  desc "Fill database with dummy data"
  task populate: :environment do

    Rake::Task['db:reset'].invoke
    Rake::Task['users:populate'].execute
    Rake::Task['pages:populate'].execute
    Rake::Task['clips:populate'].execute
    Rake::Task['screencasts:populate'].execute
    Rake::Task['impressions:populate'].execute

  end

end