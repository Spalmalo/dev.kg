handleAsciicastPreview = ->
  $("#asciicast_inputs .nav li.input_tab").click (e) ->
    $("#asciicast_preview").html('')

  $("#asciicast_inputs .nav li.preview_tab").click (e) ->
    $.rails.ajax
      dataType: 'script'
      method: 'POST'
      url: '/asciicasts/preview'
      data:
        asciicast:
          content: $("#screencast_asciicast_attributes_content").val()

jQuery ->
  handleAsciicastPreview() if $("#screencast_edit").length > 0