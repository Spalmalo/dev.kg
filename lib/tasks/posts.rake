namespace :posts do

  desc "Fill database with dummy posts"
  task populate: :environment do

    print "Creating dummy posts..."

    users = User.all

    25.times.each_with_index do |index|
      Timecop.travel index.weeks.ago do
        Post.create!  title:        FFaker::HipsterIpsum.sentence,
                      description:  FFaker::HipsterIpsum.paragraph,
                      user:         users.sample,
                      published_at: Time.now,
                      post_article_attributes: {
                        content: 10.times.to_a.map { FFaker::HipsterIpsum.paragraph }.join("\n\n")
                      }
      end
    end

    print "done\n"

  end

end