namespace :pages do

  desc "Fill database with dummy pages"
  task populate: :environment do

    print "Creating dummy pages..."

    titles = [
      "О проекте",
      "FAQ",
      "Контакты"
    ]

    titles.each do |title|

      Page.create!  title: title,
                    content:  "<p>#{ 10.times.to_a.map { Faker::HipsterIpsum.paragraph }.join('</p><p>') }</p>"

    end

    print "done\n"

  end

end