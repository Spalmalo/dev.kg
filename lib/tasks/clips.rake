namespace :clips do

  desc "Fill database with dummy clips"
  task populate: :environment do

    print "Creating dummy clips..."

    video_urls = %w[
      https://www.youtube.com/watch?v=VeiUjkiqo9E
      https://www.youtube.com/watch?v=QTOkqzCTGxw
      https://www.youtube.com/watch?v=MXK5rl3OBPQ
    ]

    users = User.all

    video_urls.each_with_index do |video_url, index|

      Timecop.travel (video_urls.count - index).weeks.ago do
        Clip.create!  title:        Faker::HipsterIpsum.sentence,
                      description:  "<p>#{ Faker::HipsterIpsum.paragraph }</p>",
                      video_url:    video_url,
                      user:         users.sample


      end
    end

    print "done\n"

  end

end