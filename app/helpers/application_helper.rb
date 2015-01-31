module ApplicationHelper

  def page_title title
    [
      title,
      t('layout.sitename')
    ].reject(&:empty?).join ' - '
  end

  def site_navigation
    # TODO refactor
    content_tag :ul, class: "nav navbar-nav" do
      concat navigation_link(t('pages.screencast_list'), root_path, controller: "screencasts")
      concat navigation_link(t('pages.clip_list'), clips_path, controller: "clips")

      Page.all.each do |page|
        concat navigation_link(page.title, page, controller: "pages", id: page.to_param)
      end
    end
  end

  private

    def navigation_link title, path, activeness_criterias={}
      class_name = activeness_criterias.keys.all? { |key| params[key] == activeness_criterias[key] } ? 'active' : ''
      content_tag :li, class: class_name do
        link_to title, path
      end
    end

end
