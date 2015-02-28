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

      references_attributes = rand(10).times.to_a.map do
        {
          title:  [Faker::HipsterIpsum.phrase, nil].sample,
          url:    Faker::Internet.http_url
        }
      end

      Timecop.travel (video_urls.count - index).weeks.ago do
        Clip.create!  title:        Faker::HipsterIpsum.sentence,
                      description:  Faker::HipsterIpsum.paragraph,
                      video_url:    video_url,
                      user:         users.sample,
                      references_attributes:  references_attributes,
                      published_at:           Time.now
      end
    end

    print "done\n"

  end

end