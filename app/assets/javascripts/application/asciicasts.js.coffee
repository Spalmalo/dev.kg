handleArticlePreview = ->
  $("#article_inputs .nav li.input_tab").click (e) ->
    $("#article_preview").html('')

  $("#article_inputs .nav li.preview_tab").click (e) ->
    $.rails.ajax
      dataType: 'script'
      method: 'POST'
      url: '/articles/preview'
      data:
        article:
          content: $("#article_input textarea").val()

jQuery ->
  handleArticlePreview() if $("#article_preview").length > 0