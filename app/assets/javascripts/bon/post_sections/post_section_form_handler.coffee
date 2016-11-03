class Bon.PostSections.PostSectionFormHandler
  constructor: (postSectionFormId) ->
    @postSectionFormId = postSectionFormId

    if postSectionFormId == 'new_post_section'
      @$form = $("##{postSectionFormId}")
      @$oldContent = @$form.parent().find('#link_to_create_new_post_section')
    else
      @$form = $("#edit_post_section_#{postSectionFormId}")
      @$oldContent = $("#post_section_#{postSectionFormId}")

    @$postSectionTitleField = @$form.find("[name='post_section[title]']")
    @$descriptionField = @$form.find("[name='post_section[description]']")

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