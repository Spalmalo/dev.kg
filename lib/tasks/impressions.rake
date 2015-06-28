namespace :impressions do

  desc "Fill database with dummy impressions"
  task populate: :environment do

    print "Creating dummy impressions..."

    User.find_each do |user|
      Video.find_each { |video| Impression.create type: ["Like", "Dislike"].sample, impressionable: video, user: user }
      Post.find_each { |post| Impression.create type: ["Like", "Dislike"].sample, impressionable: post, user: user }
    end

    print "done\n"
  end
end