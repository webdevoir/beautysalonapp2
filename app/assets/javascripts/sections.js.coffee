jQuery ->
  $('#sections tbody').sortable
    axis: 'y'
    update: ->
      $.post($(this).data('update_url'), $(this).sortable('serialize'))
