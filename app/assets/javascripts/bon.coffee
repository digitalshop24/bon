@Bon ||=
  Shared: {}
  Posts: {}
  Categories: {}

Bon.init = ->
  console.log('start bon')

  $(document).ajaxStart ->
    $("input[type='submit']").prop('disabled', true)

  $(document).ajaxStop ->
    $("input[type='submit']").prop('disabled', false)

$ ->
  Bon.init()
