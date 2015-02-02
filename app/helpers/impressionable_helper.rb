module ImpressionableHelper

  def impressionable_rating_tag rating
    class_name =  case
                  when rating < -3
                    'label-danger'
                  when rating > 3
                    'label-success'
                  else
                    'label-default'
                  end
    content_tag :span, rating, class: "label #{ class_name }"
  end
end