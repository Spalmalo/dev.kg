class HtmlWithHljs < Redcarpet::Render::HTML

  def block_code code, language
    "<pre><code class=\"language-#{ language }\">#{ code }</code></pre>\n"
  end

end