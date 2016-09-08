class Bon.Posts.PostFormHandler
  constructor: (postFormId) ->
    @postFormId = postFormId
    @$form = $("#edit_post_#{postFormId}")
    @$oldContent = $("#post_#{postFormId}")

    @$postTitleField = @$form.find("[name='post[title]']")
    @$descriptionField = @$form.find("[name='post[description]']")

    @_formSubmitHandler()
    @_cancelBtnHandler()

  _formSubmitHandler: ->
    @$form.on 'submit', =>

  _cancelBtnHandler: ->
    $cancelBtn = @$form.find('.btn-cancel')
    @$oldContent.hide()
    $cancelBtn.on 'click', (e) =>
      e.preventDefault()
      @$form.remove()
      @$oldContent.show()