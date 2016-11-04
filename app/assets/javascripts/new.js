$(document).ready(function() {
  $('.horizontalMenu .burger').on('click tap', function(e){
    e.preventDefault();
    $('.sidebar.menu').sidebar('setting',{ transition:'overlay' }).sidebar('toggle');
  });

  $('.manage .edit ').click(function(e){
    console.log('edit');
    e.preventDefault();
    // toggleLink($(this));
    $(this).parents('.link-wrapper').find('form').toggle();
  })
});
