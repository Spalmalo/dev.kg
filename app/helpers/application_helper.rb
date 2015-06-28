module ApplicationHelper

  def site_navigation
    # TODO refactor
    content_tag :ul, class: "nav navbar-nav" do
      concat navigation_link(t('pages.screencast_list'), screencasts_path, activeness_criterias: { controller: "screencasts" })
      concat navigation_link(t('pages.clip_list'), clips_path, activeness_criterias: { controller: "clips" })
      concat navigation_link(t('pages.post_list'), posts_path, activeness_criterias: { controller: "posts" })

      Page.select(:id, :slug, :title).all.each do |page|
        concat navigation_link(page.title, page, activeness_criterias: { controller: "pages", id: page.to_param })
      end
    end
  end

  def share_options
    content_tag :div, nil,  class: "yashare-auto-init sharing",
                            data: {
                              yashareL10n: "ru",
                              yashareType: "none",
                              yashareQuickServices: "facebook,twitter,vkontakte,gplus"
                            }
  end

  private

    def navigation_link title, path, options={}
      activeness_criterias = options.fetch :activeness_criterias, {}
      class_name = activeness_criterias.keys.all? { |key| params[key] == activeness_criterias[key] } ? 'active' : ''
      content_tag :li, class: class_name do
        link_to title, path, options.fetch(:link_options, {})
      end
    end

end
