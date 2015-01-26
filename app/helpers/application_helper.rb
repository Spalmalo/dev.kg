module ApplicationHelper

  def page_title title
    [
      title,
      t('layout.sitename')
    ].reject(&:empty?).join ' - '
  end

end
