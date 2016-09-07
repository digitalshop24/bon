class Bon.Posts.PostFormHandler
  constructor: (postFormId) ->
    new Enzymic.Shared.ThemeInitials()._formControlInitials()
    @postFormId = postFormId

    if postFormId == 'new_post_section'
      @$form = $("##{postFormId}")
      @$oldContent = @$form.parent().find('#link_to_create_new_post_section')
    else
      @$form = $("#edit_post_section_#{postFormId}")
      @$oldContent = $("#post_section_#{postFormId}")

    @$postTitleField = @$form.find("[name='post_section[title]']")
    @$descriptionField = @$form.find("[name='post_section[description]']")

    @_formSubmitHandler()
    @_cancelBtnHandler()

  _formSubmitHandler: ->
    @$form.on 'submit', =>
      console.log 'submit form'

  _cancelBtnHandler: ->
    console.log 'cancel'
    $cancelBtn = @$form.find('.btn-cancel')
    @$oldContent.hide()
    $cancelBtn.on 'click', (e) =>
      e.preventDefault()
      @$form.remove()
      @$oldContent.show()