module VideosHelper

  def video_tabs video
    content_tag :div, role: 'tabpanel' do
      concat video_tabs_list(video)
      concat video_tabs_data(video)
    end
  end

  private

    def video_tabs_list video
      content_tag :ul, class: "nav nav-tabs", role: "tablist" do
        tabs(video).collect do |attrs|
          concat content_tag :li, link_to(attrs[:title], "##{ attrs[:type] }", role: "tab", aria: { controls: attrs[:type] }, data: { toggle: "tab" }), class: attrs[:class], role: 'presentation'
        end
      end
    end

    def tabs video
      tabs = []
      tabs << { type: 'snippets',   title: t("video_tabs.snippets"),    content: Proc.new { render(video.snippets) } } if video.respond_to?(:snippets) and video.snippets.any?
      tabs << { type: 'references', title: t("video_tabs.references"),  content: Proc.new { content_tag :ol do; render(video.references) ; end } } if  video.respond_to?(:references) and video.references.any?
      tabs << { type: 'asciicast',  title: t("video_tabs.asciicast"),   content: Proc.new { render(video.asciicast) } } if  video.respond_to?(:asciicast) and video.asciicast.present?
      tabs << { type: 'comments',   title: t("video_tabs.comments"),    content: Proc.new { disqus_thread(video.id, video.title) } }
      tabs.first[:class] = 'active'
      tabs
    end

    def video_tabs_data video
      content_tag :div, class: 'tab-content' do
        tabs(video).collect do |tab|
          div = content_tag :div, id: tab[:type], class: "tab-pane #{ tab[:class] }", role: "tabpanel" do
            tab[:content].call
          end

          concat div
        end
      end
    end
end