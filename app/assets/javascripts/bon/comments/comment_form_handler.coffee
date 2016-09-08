class Bon.Comments.CommentFormHandler
  constructor: (commentFormId) ->
    @_formSubmitHandler()

  _formSubmitHandler: ->
    @$form.on 'submit', =>