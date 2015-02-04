module ScreencastsHelper

  def screencast_tabs screencast
    content_tag :div, role: 'tabpanel' do
      concat screencast_tabs_list(screencast)
      concat screencast_tabs_data(screencast)
    end
  end

  private

    def screencast_tabs_list screencast
      content_tag :ul, class: "nav nav-tabs", role: "tablist" do
        tabs(screencast).collect do |attrs|
          concat content_tag :li, link_to(attrs[:title], "##{ attrs[:type] }", role: "tab", aria: { controls: attrs[:type] }, data: { toggle: "tab" }), class: attrs[:class], role: 'presentation'
        end
      end
    end

    def tabs screencast
      tabs = []
      tabs << { type: 'snippets',   title: t("screencast_show.tabs.snippets"),    content: Proc.new { render(@screencast.snippets) } } if @screencast.snippets.any?
      tabs << { type: 'references', title: t("screencast_show.tabs.references"),  content: Proc.new { content_tag :ol do; render(@screencast.references) ; end } } if @screencast.references.any?
      tabs << { type: 'comments',   title: t("screencast_show.tabs.comments"),    content: Proc.new { disqus_thread(@screencast.id, @screencast.title) } }
      tabs.first[:class] = 'active'
      tabs
    end

    def screencast_tabs_data screencast
      content_tag :div, class: 'tab-content' do
        tabs(screencast).collect do |tab|
          div = content_tag :div, id: tab[:type], class: "tab-pane #{ tab[:class] }", role: "tabpanel" do
            tab[:content].call
          end

          concat div
        end
      end
    end
end