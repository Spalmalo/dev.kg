namespace :users do

  desc "Fill database with dummy users"
  task populate: :environment do

    print "Creating dummy users..."

    users = [
      {
        provider: "github",
        uid:      "111111",
        nickname: "shekelman",
        email:    "joseph@shekelman.com",
        name:     "Joseph Shekelman",
        image:    "http://www.gravatar.com/avatar/0"
      },
      {
        provider: "github",
        uid:      "222222",
        nickname: "derpherp",
        email:    "derp.herpenson@gmail.com",
        name:     "Derp Herpenson",
        image:    "http://www.gravatar.com/avatar/0"
      },
      {
        provider: "github",
        uid:      "333333",
        nickname: "erohin",
        email:    "erohin@mail.ru",
        name:     "Ерохин",
        image:    "http://www.gravatar.com/avatar/0"
      }
    ]

    User.create users

    print "done\n"

  end

end