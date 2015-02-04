namespace :snippets do

  desc "Fill database with dummy snippets"
  task populate: :environment do

    print "Creating dummy snippets..."

    snippets = [
      {
        description: 'app/models/post.rb',
        language: 'ruby',
        code: 'class Post < ActiveRecord::Base
  validates: :title, presence: true
end'
      },
      {
        description: 'app/assets/stylesheets/posts.scss',
        language: 'scss',
        code: '.post {
  h2 {
    color: #333;
  }
}'
      },
      {
        description: nil,
        language: 'json',
        code: '{
  "id": 123,
  "title": "Awesome post!"
}'
      },
      {
        description: nil,
        language: 'bash',
        code: 'rails generate model Post title'
      }
    ]

    Screencast.find_each do |screencast|
      screencast.snippets.create snippets.sample(rand snippets.count)
    end

    print "done\n"

  end

end