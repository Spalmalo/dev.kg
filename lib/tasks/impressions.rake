namespace :impressions do

  desc "Fill database with dummy impressions"
  task populate: :environment do

    print "Creating dummy impressions..."

    Video.find_each do |video|
      User.find_each do |user|
        Impression.create type: ["Like", "Dislike"].sample, video: video, user: user
      end
    end

    print "done\n"
  end
end