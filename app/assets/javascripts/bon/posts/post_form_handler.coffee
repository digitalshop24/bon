class Bon.Posts.PostFormHandler
  constructor: (postFormId) ->
    new Post.Shared.ThemeInitials()._formControlInitials()
    @adFormId = adFormId

    if adFormId == 'new_ad'
      @$form = $("##{adFormId}")
      @$oldContent = @$form.parent().find('#link_to_create_new_ad')
    else
      @$form = $("#edit_ad_#{adFormId}")
      @$oldContent = $("#ad_#{adFormId}")

#    @$x = @$form.find("[name='ad[x]']")
#    @$y = @$form.find("[name='ad[y]']")
#    @$width = @$form.find("[name='ad[width]']")
#    @$height = @$form.find("[name='ad[height]']")

    @$uploadImageContainer = @$form.find('.ad-upload-image')
    @$imageUploadPreviewContainer = @$uploadImageContainer.find('.image-preview')
    @$fetchImageContainer = @$form.find('.ad-fetch-image')
    @$destinationUrlField = @$form.find("input[name='ad[destination_url]']")
    @$fetchImageRadioButton = @$form.find("input[value='fetch_image']")
    @$uploadImageRadioButton = @$form.find("input[value='upload_image']")
    @$fileUploadInput = @$form.find("input[name='ad[image]']")
    @$cropImageButton = @$form.find('.crop-image-button')
    @$adTitleField = @$form.find("[name='ad[title]']")
    @$fetchingIcon = @$adTitleField.parent().find('i.fetching-icon')
    @$validationIcon = @$destinationUrlField.parent().find('i.validation-icon')
    @$descriptionCheckboxField = @$form.find("input[name='ad[has_description]']")
    @$descriptionField = @$form.find("input[name='ad[description]']")

    @_cancelBtnHandler()
    @_imageUploadSelectorHandler(@$form)
    @_destinationUrlHandler()
    @_toggleImageUploadSelector()
    @_formSubmitHandler()
    @_formImageFieldHandler()
    @_descriptionCheckboxHandler()
    @_checkDescriptionShowing()
    new Enzymic.Ads.FetchImages(@$form)

  _formImageFieldHandler: ->
    @$fileUploadInput.on 'change', (e) =>
      new Enzymic.Shared.ImageUploadPreview(e.target)
      @$imageUploadPreviewContainer.find('img').remove()
      new Enzymic.Ads.AdImageCrop(@$form, @$imageUploadPreviewContainer)

  _formSubmitHandler: ->
    @$form.on 'submit', =>
      imageUploadSelector = @$form.find(
        "input[name='imageUploadSelector']:checked"
      ).val()
      switch imageUploadSelector
        when 'upload_image'
          img = @$imageUploadPreviewContainer.find('img')
#          @_setCoordsFields(img) if img
        else null

#  _setCoordsFields: (img) ->
#    if img.data('x')? && img.data('y')? && img.data('width')? && img.data('height')?
#      @$x.val(img.data('x'))
#      @$y.val(img.data('y'))
#      @$width.val(img.data('width'))
#      @$height.val(img.data('height'))

  _cancelBtnHandler: ->
    $cancelBtn = @$form.find('.btn-cancel')
    @$oldContent.hide()
    $cancelBtn.on 'click', (e) =>
      e.preventDefault()
      @$form.remove()
      @$oldContent.show()

  _destinationUrlHandler: ->
    @$destinationUrlField.on 'input', (e) =>
      @_toggleImageUploadSelector()

    @$destinationUrlField.on 'focusout', (e) =>
      destinationUrlStatus = @_isDestinationUrlValid()
      if destinationUrlStatus == false && !@$adTitleField.val()
        @$fetchingIcon.removeClass('md-done')
        @$fetchingIcon.addClass('md-spin md-autorenew')
        @$adTitleField.prop('disabled', true)
        @_getFetchTitle()

  _toggleImageUploadSelector: ->
    destinationUrlStatus = @_isDestinationUrlValid()
    @$fetchImageRadioButton.prop('disabled', destinationUrlStatus)
    if destinationUrlStatus
      @_switchToUploadImageContainer()
      @$fetchImageRadioButton.prop('checked', !destinationUrlStatus)
      @$uploadImageRadioButton.prop('checked', destinationUrlStatus)
      @$validationIcon.addClass('md-block')
    else
      @$validationIcon.removeClass('md-block')
      @$validationIcon.addClass('md-done')