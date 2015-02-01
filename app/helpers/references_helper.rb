module ReferencesHelper

  def reference_title reference
    if reference.title.blank?
      reference.url.truncate 50
    else
      reference.title
    end
  end
end