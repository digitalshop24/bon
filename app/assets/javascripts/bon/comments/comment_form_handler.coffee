class Bon.Comments.CommentFormHandler
  constructor: (commentFormId) ->
    @commentFormId = commentFormId
    @$form = $("#edit_comment_#{commentFormId}")
    @$oldContent = $("#comment_#{commentFormId}")


    @_formSubmitHandler()

  _formSubmitHandler: ->
    @$form.on 'submit', =>

  _cancelBtnHandler: ->
    $cancelBtn = @$form.find('.btn-cancel')
    @$oldContent.hide()
    $cancelBtn.on 'click', (e) =>
      e.preventDefault()
      @$form.remove()
      @$oldContent.show()