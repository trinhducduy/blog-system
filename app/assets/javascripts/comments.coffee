$(document).on "page:change", ->
  $('.reply-btn').click (event) ->
    event.preventDefault() 
    id = $(this).data('id')
    $('#form_reply_'+id).toggleClass('hide')
    $('#children_'+id).toggleClass('hide')
    $(this).find('.reply-icon').toggleClass("fa-caret-down fa-caret-up")