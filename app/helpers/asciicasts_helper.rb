module AsciicastsHelper

  def asciicast_html asciicast
    markdown.render(asciicast.content || "")
  end

  private

    def markdown
      Redcarpet::Markdown.new(HtmlWithHljs, fenced_code_blocks: true)
    end
end