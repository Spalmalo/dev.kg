module AsciicastsHelper

  def asciicast_html asciicast
    markdown.render asciicast.content
  end

  private

    def markdown
      Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
    end
end