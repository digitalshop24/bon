$(document).ready(function() {
  $('.burger[data-menu="sidebar"]').on('click tap', function(e){
    e.preventDefault();
    $('.sidebar.menu').sidebar('setting',{ transition:'overlay' }).sidebar('toggle');
  });

  $('.links').on('click', '.new,.edit', function(e){
    e.preventDefault();
    $(this).parents('.link-wrapper').find('form').toggle();
  })
});
