module Renderable
  extend ActiveSupport::Concern

  included do
    before_save :render_content
  end

  private

    def render_content
      self.content_html = markdown.render(content || "")
    end

    def markdown
      Redcarpet::Markdown.new(HtmlWithHljs, fenced_code_blocks: true)
    end

end