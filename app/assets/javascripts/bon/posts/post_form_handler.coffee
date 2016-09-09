class Bon.Posts.PostFormHandler
  constructor: (postFormId) ->
    @postFormId = postFormId
    @$form = $("#edit_post_#{postFormId}")
    @$oldContent = $("#post_#{postFormId}")

    @$postTitleField = @$form.find("[name='post[title]']")
    @$descriptionField = @$form.find("[name='post[description]']")

    @_formSubmitHandler()
    @_cancelBtnHandler()
    @_previewImageHandler()

  _formSubmitHandler: ->
    @$form.on 'submit', =>

  _cancelBtnHandler: ->
    $cancelBtn = @$form.find('.btn-cancel')
    @$oldContent.hide()
    $cancelBtn.on 'click', (e) =>
      e.preventDefault()
      @$form.remove()
      @$oldContent.show()

  _previewImageHandler: ->
    $('#post_preview').on 'change', (event) =>
      files = event.target.files
      image = files[0]
      reader = new FileReader()
      reader.onload = (file) =>
        img = new Image()
        img.src = file.target.result
        console.log(img)
        $('#previewTarget').attr('src', img.src)
      reader.readAsDataURL(image)

