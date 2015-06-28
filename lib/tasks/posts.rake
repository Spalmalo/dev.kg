namespace :posts do

  desc "Fill database with dummy posts"
  task populate: :environment do

    print "Creating dummy posts..."

    users = User.all

    25.times.each_with_index do |index|
      Timecop.travel index.weeks.ago do
        Post.create!  title:        FFaker::HipsterIpsum.sentence,
                      description:  FFaker::HipsterIpsum.paragraph,
                      user:         users.sample
      end
    end

    print "done\n"

  end

end