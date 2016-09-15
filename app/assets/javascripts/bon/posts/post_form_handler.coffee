class Bon.Posts.PostFormHandler
  constructor: (postFormId) ->
    @postFormId = postFormId
    if @postFormId
      @$form = $("#edit_post_#{postFormId}")
      @$oldContent = $("#post_#{postFormId}")
    else
      @$form = $("new_post")
      @$oldContent = $("#post")

    @$postTitleField = @$form.find("[name='post[title]']")
    @$descriptionField = @$form.find("[name='post[description]']")

    @_formSubmitHandler()
    @_cancelBtnHandler()
    @_previewPreviewHandler()
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

  _previewPreviewHandler: ->
    $('#post_preview').on 'change', (event) =>
      files = event.target.files
      image = files[0]
      reader = new FileReader()
      reader.onload = (file) =>
        img = new Image()
        img.src = file.target.result
        $('#previewTarget').attr('src', img.src)
      reader.readAsDataURL(image)

  _previewImageHandler: ->
    $("#imagesUpload").on 'change', (event) =>
      files = event.target.files
      if (files && files[0])
        for file in files
          reader = new FileReader()
          reader.onload = (file) =>
            image_html = new Image()
            image_html.src = file.target.result
            $('#previewImages').append(image_html)
          reader.readAsDataURL(file)

