$(document).ready(function() {
  $('.horizontalMenu .burger').on('click tap', function(e){
    e.preventDefault();
    $('.sidebar.menu').sidebar('setting',{ transition:'overlay' }).sidebar('toggle');
  });
});
