namespace :screencasts do

  desc "Fill database with dummy screencasts"
  task populate: :environment do

    print "Creating dummy screencasts..."

    video_urls = %w[
      https://www.youtube.com/watch?v=qpgT_62y5kQ
      https://www.youtube.com/watch?v=oeRbVzthZ4I
      https://www.youtube.com/watch?v=pA9PVjHEDLI
      https://www.youtube.com/watch?v=vpq_ab026zA
      https://www.youtube.com/watch?v=eHMLiAhhhCU
      https://www.youtube.com/watch?v=z_Ei_eR99wE
      https://www.youtube.com/watch?v=0aeilcEcjlM
      https://www.youtube.com/watch?v=HyTqF3rxBsM
      https://www.youtube.com/watch?v=TXhpM0WM0_w
      https://www.youtube.com/watch?v=0OFeu10SJ3o
      https://www.youtube.com/watch?v=ePgND--6Cbc
      https://www.youtube.com/watch?v=4U6JiLGg0R4
      https://www.youtube.com/watch?v=XXF1eOatSeY
      https://www.youtube.com/watch?v=g7NC3zoeffg
      https://www.youtube.com/watch?v=l6R4tnNxFoI
      https://www.youtube.com/watch?v=sQbuCOuQTZ8
      https://www.youtube.com/watch?v=KnBO6k0oPxY
      https://www.youtube.com/watch?v=JIYZarsE7NE
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
        Screencast.create!  title:                  Faker::HipsterIpsum.sentence,
                            description:            Faker::HipsterIpsum.paragraph,
                            video_url:              video_url,
                            user:                   users.sample,
                            references_attributes:  references_attributes
      end
    end

    print "done\n"

  end

end