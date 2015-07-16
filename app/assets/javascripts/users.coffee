$(document).on "page:change", ->
  # Button relationship
  $('.btn-relationship').click (e) ->
    e.preventDefault()
    element = $(this)
    id = $(this).data('id')
    url = $(this).data('url')
    action = $(this).data('action')

    if action == 'follow'
      data = 'followed_id='+id
      method = 'POST'
    else
      data = ''
      method = 'DELETE'

    $.ajax
      url: url
      method: method
      data: data
      dataType: 'json'
      error: (e) ->
        console.log(e)
      success: (data) ->
        element.data('id', data.id) if data.id
        element.data('url', data.url)

        if action == 'follow'
          element.data('action', 'unfollow')
          element.text('Unfollow')
          element.removeClass('btn-primary').addClass('btn-danger')
        else
          element.data('action', 'follow')
          element.text('Follow')
          element.removeClass('btn-danger').addClass('btn-primary')